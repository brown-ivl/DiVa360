import numpy as np
import json
import math
import os
from argparse import ArgumentParser

# code from https://automaticaddison.com/how-to-multiply-two-quaternions-together-using-python/
def quaternion_multiply(Q0,Q1):
    """
    Multiplies two quaternions.
 
    Input
    :param Q0: A 4 element array containing the first quaternion (q01,q11,q21,q31) 
    :param Q1: A 4 element array containing the second quaternion (q02,q12,q22,q32) 
 
    Output
    :return: A 4 element array containing the final quaternion (q03,q13,q23,q33) 
 
    """
    # Extract the values from Q0
    w0 = Q0[3]
    x0 = Q0[0]
    y0 = Q0[1]
    z0 = Q0[2]
     
    # Extract the values from Q1
    w1 = Q1[3]
    x1 = Q1[0]
    y1 = Q1[1]
    z1 = Q1[2]
     
    # Computer the product of the two quaternions, term by term
    Q0Q1_w = w0 * w1 - x0 * x1 - y0 * y1 - z0 * z1
    Q0Q1_x = w0 * x1 + x0 * w1 + y0 * z1 - z0 * y1
    Q0Q1_y = w0 * y1 - x0 * z1 + y0 * w1 + z0 * x1
    Q0Q1_z = w0 * z1 + x0 * y1 - y0 * x1 + z0 * w1
     
    # Create a 4 element array containing the final quaternion
    final_quaternion = np.array([Q0Q1_x, Q0Q1_y, Q0Q1_z, Q0Q1_w])
     
    # Return a 4 element arra
    return final_quaternion

# Code from https://automaticaddison.com/
# how-to-convert-a-quaternion-to-a-rotation-matrix/
def quaternion_rotation_matrix(Q):
    """
    Covert a quaternion into a full three-dimensional rotation matrix.
 
    Input
    :param Q: A 4 element array representing the quaternion (q0,q1,q2,q3) 
 
    Output
    :return: A 3x3 element matrix representing the full 3D rotation matrix. 
             This rotation matrix converts a point in the local reference 
             frame to a point in the global reference frame.
    """
    # Extract the values from Q
    q0 = Q[0]
    q1 = Q[1]
    q2 = Q[2]
    q3 = Q[3]
    
    # First row of the rotation matrix
    r00 = 2 * (q0 * q0 + q1 * q1) - 1
    r01 = 2 * (q1 * q2 - q0 * q3)
    r02 = 2 * (q1 * q3 + q0 * q2)
     
    # Second row of the rotation matrix
    r10 = 2 * (q1 * q2 + q0 * q3)
    r11 = 2 * (q0 * q0 + q2 * q2) - 1
    r12 = 2 * (q2 * q3 - q0 * q1)
     
    # Third row of the rotation matrix
    r20 = 2 * (q1 * q3 - q0 * q2)
    r21 = 2 * (q2 * q3 + q0 * q1)
    r22 = 2 * (q0 * q0 + q3 * q3) - 1
     
    # 3x3 rotation matrix
    rot_matrix = np.array([[r00, r01, r02],
                           [r10, r11, r12],
                           [r20, r21, r22]])
                            
    return rot_matrix

# code from https://automaticaddison.com/how-to-convert-euler-angles-to-quaternions-using-python/
def get_quaternion_from_euler(roll, pitch, yaw):
  """
  Convert an Euler angle to a quaternion.
   
  Input
    :param roll: The roll (rotation around x-axis) angle in radians.
    :param pitch: The pitch (rotation around y-axis) angle in radians.
    :param yaw: The yaw (rotation around z-axis) angle in radians.
 
  Output
    :return qx, qy, qz, qw: The orientation in quaternion [x,y,z,w] format
  """
  qx = np.sin(roll/2) * np.cos(pitch/2) * np.cos(yaw/2) - np.cos(roll/2) * np.sin(pitch/2) * np.sin(yaw/2)
  qy = np.cos(roll/2) * np.sin(pitch/2) * np.cos(yaw/2) + np.sin(roll/2) * np.cos(pitch/2) * np.sin(yaw/2)
  qz = np.cos(roll/2) * np.cos(pitch/2) * np.sin(yaw/2) - np.sin(roll/2) * np.sin(pitch/2) * np.cos(yaw/2)
  qw = np.cos(roll/2) * np.cos(pitch/2) * np.cos(yaw/2) + np.sin(roll/2) * np.sin(pitch/2) * np.sin(yaw/2)
 
  return [qx, qy, qz, qw]

def base_cam_to_transform(Q, T):
    R = quaternion_rotation_matrix(Q)
    mat = np.concatenate((R, T.T), axis=1)
    mat = mat[[2, 1, 0], :]
    mat[:,3] -= [0.5, 0.5, 0.5]
    mat[:,3] /= 0.33
    mat[:,2] *= -1
    mat[:,1] *= -1
    
    mat[:3, :3] = mat[:3, :3].T
    mat[:,0] *= -1
    mat[:,1] *= -1
    mat = mat[[0, 2, 1], :]

    mat = np.concatenate((mat, [[0., 0., 0., 1.]]), axis=0)
    return mat    

if __name__=="__main__":
    parser = ArgumentParser()
    parser.add_argument("--src", required=True, help="Source of BRICS dataset")
    parser.add_argument("--dst", required=True, help="Destination in assets")
    parser.add_argument("--num_frames", type=int, default=0)
    parser.add_argument("--max_r", type=float, default=1.0)
    parser.add_argument("--min_r", type=float, default=0.5)
    parser.add_argument("--center", nargs=3, default=[0.5, 0.5, 0.5], type=float)
    args = parser.parse_args()
    path = args.src
    output = args.dst
    f = open(path)
    params = json.load(f)
    trajectory = {}
    trajectory['frames'] = []
    # radius of circle
    #r = 1.0
    # center of the circle
    center = args.center
    # time step
    t = args.num_frames

    # radius of circle
    max_r = args.max_r
    min_r = args.min_r
    r_step = (max_r - min_r)/t
    # one circle every 150 frames
    angle_step = 2*math.pi/(150)
    cur_angle = 0
    h_step = -2.0/t
    cur_h = 1.3 #-0.4
    # parameter for rotation
    v1 = [0, 0, 1]
    prev_Q = None
    for i in range(t):
        r = min_r + i * r_step
        # may have bug for some cases
        T = np.array([[r*math.cos(cur_angle)+center[0], center[1]+cur_h, r*math.sin(cur_angle)+center[2]]])
        v2 = np.array([-r*math.cos(cur_angle), 0., -r*math.sin(cur_angle)])
        v1 /= np.linalg.norm(v1)
        v2 /= np.linalg.norm(v2)
        xyz = np.cross(v1, v2)
        v1_len = math.sqrt(v1[0]*v1[0]+v1[1]*v1[1]+v1[2]*v1[2])
        v2_len = math.sqrt(v2[0]*v2[0]+v2[1]*v2[1]+v2[2]*v2[2])
        w = v1_len*v2_len + np.dot(v1, v2)
        Q = np.array([xyz[0], xyz[1], xyz[2], w])
        Q /= np.linalg.norm(Q)
        if i!=0:
            Q = quaternion_multiply(Q, prev_Q)
        # face to the center
        v3 = np.array([r, cur_h])
        v3 = v3 / np.linalg.norm(v3)
        dot_product = np.dot(np.array([1, 0]), v3)
        angle = np.arccos(dot_product)
        if cur_h<0:
            angle *= -1
        Q /= np.linalg.norm(Q)
        Q2 = quaternion_multiply(Q, np.array(get_quaternion_from_euler(angle, 0., 0.)))
        Q2 /= np.linalg.norm(Q2)
        # upside down
        Q3 = quaternion_multiply(Q2, np.array(get_quaternion_from_euler(0., 0., math.pi)))
        Q3 /= np.linalg.norm(Q3)
        mat = base_cam_to_transform(Q3, T)       
        # make new json
        trajectory['frames'].append(params['frames'][0].copy())
        trajectory['frames'][-1]['transform_matrix'] = mat.tolist()
        trajectory['frames'][-1]['file_path'] = f'cam{i:05d}'
        # high resolution
        w = 1168 #1168*2
        h = 556 #556*2
        trajectory['frames'][-1]['fl_x'] = trajectory['frames'][-1]['fl_x']*(w/trajectory['frames'][-1]['w'])
        trajectory['frames'][-1]['fl_y'] = trajectory['frames'][-1]['fl_y']*(h/trajectory['frames'][-1]['h'])
        trajectory['frames'][-1]['cx'] = trajectory['frames'][-1]['cx']*(w/trajectory['frames'][-1]['w'])
        trajectory['frames'][-1]['cy'] = trajectory['frames'][-1]['cy']*(h/trajectory['frames'][-1]['h'])
        trajectory['frames'][-1]['w'] = w
        trajectory['frames'][-1]['h'] = h
        trajectory['frames'][-1]['camera_angle_x'] = 2*np.arctan2(trajectory['frames'][-1]['w'],2*trajectory['frames'][-1]['fl_x'])
        trajectory['frames'][-1]['camera_angle_y'] = 2*np.arctan2(trajectory['frames'][-1]['h'],2*trajectory['frames'][-1]['fl_y'])
        cur_angle += angle_step
        cur_h += h_step
        v1 = v2
        prev_Q = Q
    print(f"writing {output}")
    with open(output, "w") as outfile:
        json.dump(trajectory, outfile, indent=2)
