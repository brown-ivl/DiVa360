import os
import json
import numpy as np
import cv2 as cv
import torch
from argparse import ArgumentParser
from skimage.metrics import structural_similarity
from torchmetrics.image.lpip import LearnedPerceptualImagePatchSimilarity


def lpips_loss(image_pred, image_gt, lpips_net, device = torch.device('cuda')):
    image_pred = torch.from_numpy(image_pred).float().to(device)
    image_gt = torch.from_numpy(image_gt).float().to(device)
    image_pred = image_pred.unsqueeze(0).permute(0,3,1,2)
    image_gt = image_gt.unsqueeze(0).permute(0,3,1,2)
    
    # Normalizing the images to [-1, 1]
    image_pred = image_pred * 2 - 1
    image_gt = image_gt * 2 - 1
    return lpips_net(image_pred, image_gt).detach().cpu().numpy()


def benchmark(root, start, num_frames, device = torch.device('cuda'), model_name = "I-NGP/test", wh_bg=False):
    f = open(os.path.join(root, 'dynamic_data', 'transforms_test.json'))
    jd = json.load(f)
    avg_psnr = 0
    avg_ssim = 0
    avg_lpips = 0
    count = 0
    lpips_net = LearnedPerceptualImagePatchSimilarity(net_type='vgg').to(device)
    object_name = root.split('/')[-1]
    for view in jd['frames']:
        cam = view['file_path'].split('/')[-2]
        for i in range(start, start+num_frames, 1):
            gt_root = root
            gt_path = os.path.join(gt_root, 'dynamic_data', 'frames_1', cam, f'{i:08d}.png')
            pred_path = os.path.join(root, 'dynamic_data', model_name, cam, f'{i:08d}.png')

            gt = cv.cvtColor(cv.imread(gt_path, cv.IMREAD_UNCHANGED), cv.COLOR_BGRA2RGBA)
            pred = cv.cvtColor(cv.imread(pred_path, cv.IMREAD_UNCHANGED), cv.COLOR_BGRA2RGBA)

            gt = gt.astype(np.float32)
            gt /= 255.
            bg_color = 1.0 if wh_bg else 0.0
            gt = gt[..., :3]*gt[..., 3:4] + (1.-gt[..., 3:4])*bg_color
            gt = (gt*255).astype(np.uint8)
            pred = pred.astype(np.float32)
            pred /= 255.
            pred = pred[..., :3]*pred[..., 3:4] + (1.-pred[..., 3:4])*bg_color
            pred = (pred*255).astype(np.uint8)

            psnr = cv.PSNR(gt, pred)
            ssim = structural_similarity(gt, pred, channel_axis=2)
            gt = gt.astype(np.float32)
            gt /= 255.
            pred = pred.astype(np.float32)
            pred /= 255.
            lpips = float(lpips_loss(pred, gt, lpips_net, device))
            count += 1

            avg_psnr += psnr
            avg_ssim += ssim
            avg_lpips += lpips

    print("PSNR", avg_psnr/count)
    print("SSIM", avg_ssim/count)
    print("LPIPS", avg_lpips/count)

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("--root", required=True, help="Object folder")
    parser.add_argument("--start", type=int, default=0)
    parser.add_argument("--num_frames", type=int, default=1)
    parser.add_argument("--target_path", type=str, default=os.path.join("I-NGP", "test"))
    parser.add_argument("--wh_bg", action='store_true')
    args = parser.parse_args()
        
    benchmark(args.root, args.start, args.num_frames, model_name = args.target_path, wh_bg = args.wh_bg)
