import numpy as np
import json
import cv2
import os
import math
from glob import glob
from argparse import ArgumentParser


def closest_point_2_lines(oa, da, ob, db): # returns point closest to both rays of form o+t*d, and a weight factor that goes to 0 if the lines are parallel
    da = da / np.linalg.norm(da)
    db = db / np.linalg.norm(db)
    c = np.cross(da, db)
    denom = np.linalg.norm(c)**2
    t = ob - oa
    ta = np.linalg.det([t, db, c]) / (denom + 1e-10)
    tb = np.linalg.det([t, da, c]) / (denom + 1e-10)
    if ta > 0:
	    ta = 0
    if tb > 0:
	    tb = 0
    return (oa+ta*da+ob+tb*db) * 0.5, denom

def rotmat(a, b):
    a, b = a / np.linalg.norm(a), b / np.linalg.norm(b)
    v = np.cross(a, b)
    c = np.dot(a, b)
    # handle exception for the opposite direction input
    if c < -1 + 1e-10:
        return rotmat(a + np.random.uniform(-1e-2, 1e-2, 3), b)
    s = np.linalg.norm(v)
    kmat = np.array([[0, -v[2], v[1]], [v[2], 0, -v[0]], [-v[1], v[0], 0]])
    return np.eye(3) + kmat + kmat.dot(kmat) * ((1 - c) / (s ** 2 + 1e-10))

def variance_of_laplacian(image):
    return cv2.Laplacian(image, cv2.CV_64F).var()

def qvec2rotmat(qvec):
    return np.array([
		[
			1 - 2 * qvec[2]**2 - 2 * qvec[3]**2,
			2 * qvec[1] * qvec[2] - 2 * qvec[0] * qvec[3],
			2 * qvec[3] * qvec[1] + 2 * qvec[0] * qvec[2]
		], [
			2 * qvec[1] * qvec[2] + 2 * qvec[0] * qvec[3],
			1 - 2 * qvec[1]**2 - 2 * qvec[3]**2,
			2 * qvec[2] * qvec[3] - 2 * qvec[0] * qvec[1]
		], [
			2 * qvec[3] * qvec[1] - 2 * qvec[0] * qvec[2],
			2 * qvec[2] * qvec[3] + 2 * qvec[0] * qvec[1],
			1 - 2 * qvec[1]**2 - 2 * qvec[2]**2
		]
	])

def sharpness(imagePath):
    image = cv2.imread(imagePath)
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    fm = variance_of_laplacian(gray)
    return fm

def param2NeRF(ROOT, AABB_SCALE, USE_KP):
    TEXT_FOLDER = ROOT
    NAME = os.path.join(ROOT, 'image')
    OUT_PATH = os.path.join(ROOT, 'transforms_optim.json')
    names = glob(os.path.join(NAME, '**', '*.png'))
    names.sort()
    #print(NAME, names)
    names = names[::len(names)//53]

    out = {"frames": []}

    up = np.zeros(3)
    with open(os.path.join(TEXT_FOLDER, "optim_params.txt"), "r") as f:
        angle_x = math.pi / 2
        for i, line in enumerate(f):
            els = line.split(" ")
            if els[0]=="#":
                continue
            name = names[i-1]
            cam_id = els[0]
            w = float(els[1])
            h = float(els[2])
            fl_x = float(els[3])
            fl_y = float(els[4])
            k1 = float(els[7])
            k2 = float(els[8])
            #k3 = 0
            #k4 = 0
            p1 = float(els[9])
            p2 = float(els[10])
            cx = float(els[5])
            cy = float(els[6])
            cam_name = els[11]
            qvec = np.array(tuple(map(float, els[12:16])))
            tvec = np.array(tuple(map(float, els[16:19])))
            is_fisheye = False
            # fl = 0.5 * w / tan(0.5 * angle_x);
            angle_x = math.atan(w / (fl_x * 2)) * 2
            angle_y = math.atan(h / (fl_y * 2)) * 2
            #fovx = angle_x * 180 / math.pi
            #fovy = angle_y * 180 / math.pi
            bottom = np.array([0.0, 0.0, 0.0, 1.0]).reshape([1, 4])
            R = qvec2rotmat(-qvec)
            t = tvec.reshape([3,1])
            m = np.concatenate([np.concatenate([R, t], 1), bottom], 0)
            c2w = np.linalg.inv(m)
        
            c2w[0:3,2] *= -1 # flip the y and z axis
            c2w[0:3,1] *= -1
            c2w = c2w[[1,0,2,3],:]
            c2w[2,:] *= -1 # flip whole world upside down
            up += c2w[0:3,1]
        
            b = sharpness(name)
            print(name, "sharpness =",b)
            start = len(ROOT.split("/"))
            frame = {"file_path": os.path.join(*name.split("/")[start:]), "sharpness":b, "transform_matrix": c2w}
            frame["camera_angle_x"] = angle_x
            frame["camera_angle_y"] = angle_y
            frame["fl_x"] = fl_x
            frame["fl_y"] = fl_y
            if USE_KP:
                frame["k1"] = k1
                frame["k2"] = k2
                #frame["k3"] = k3
                #frame["k4"] = k4
                frame["p1"] = p1
                frame["p2"] = p2
            frame["is_fisheye"] = is_fisheye
            frame["cx"] = cx
            frame["cy"] = cy
            frame["w"] = w
            frame["h"] = h
            frame["aabb_scale"] = AABB_SCALE
            out["frames"].append(frame)
            out["aabb_scale"] = AABB_SCALE
            #out["is_fisheye"] = is_fisheye
            # cx and cy are differnt between frames
            #out["cx"] = cx
            #out["cy"] = cy
            #out["w"] = w
            #out["h"] = h
            #out["fl_x"] = fl_x
            #out["fl_y"] = fl_y
            #out["k1"] = k1
            #out["k2"] = k2
            #out["p1"] = p1
            #out["p2"] = p2

    up = up / np.linalg.norm(up)
    print("up vector was", up)
    R = rotmat(up,[0,0,1]) # rotate up vector to [0,0,1]
    R = np.pad(R,[0,1])
    R[-1, -1] = 1

    for f in out["frames"]:
        f["transform_matrix"] = np.matmul(R, f["transform_matrix"]) # rotate up to be the z axis

    # find a central point they are all looking at
    print("computing center of attention...")
    totw = 0.0
    totp = np.array([0.0, 0.0, 0.0])
    for f in out["frames"]:
        mf = f["transform_matrix"][0:3,:]
        for g in out["frames"]:
            mg = g["transform_matrix"][0:3,:]
            p, w = closest_point_2_lines(mf[:,3], mf[:,2], mg[:,3], mg[:,2])
            if w > 0.00001:
                totp += p*w
                totw += w
    if totw > 0.0:
        totp /= totw
    print(totp) # the cameras are looking at totp
    for f in out["frames"]:
        f["transform_matrix"][0:3,3] -= totp

    avglen = 0.
    nframes = len(out["frames"])
    for f in out["frames"]:
        avglen += np.linalg.norm(f["transform_matrix"][0:3,3])
    avglen /= nframes
    print("avg camera distance from origin", avglen)
    for f in out["frames"]:
        f["transform_matrix"][0:3,3] *= 4.0 / avglen # scale to "nerf sized"

    for f in out["frames"]:
        f["transform_matrix"] = f["transform_matrix"].tolist()

    print(f"writing {OUT_PATH}")
    with open(OUT_PATH, "w") as outfile:
        json.dump(out, outfile, indent=2)

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("--root", required=True, help="Object folder")
    parser.add_argument("--use_kp", action="store_true")
    parser.add_argument("--aabb_scale", type=int, default=4)
    args = parser.parse_args()

    param2NeRF(args.root, args.aabb_scale, args.use_kp)
