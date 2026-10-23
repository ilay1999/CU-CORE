#!/usr/bin/env python3
"""X-47 drum mag icon: rotate vertical source to horizontal, pixelate to ~48 long edge, then mirror."""
import os
from PIL import Image

src = r"g:\modmake\TKF_weapon\Framework\Assets\guns\akm\x47.webp"
dst = r"g:\modmake\TKF_weapon\Framework\Assets\guns\akm\x47.png"
target = 48

img = Image.open(src).convert("RGBA")
print("Source:", img.size)

# Rotate 90 CW to make horizontal
img = img.rotate(-90, expand=True)
print("After rotate:", img.size)

# Crop to non-transparent bounding box
bbox = img.getbbox()
if bbox:
    img = img.crop(bbox)
    print("Cropped:", img.size, bbox)

w, h = img.size
intermediate = target * 2
scale = intermediate / max(w, h)
iw, ih = max(1, int(round(w * scale))), max(1, int(round(h * scale)))
img_small = img.resize((iw, ih), Image.NEAREST)
scale2 = target / max(iw, ih)
fw, fh = max(1, int(round(iw * scale2))), max(1, int(round(ih * scale2)))
img_final = img_small.resize((fw, fh), Image.NEAREST)
print("Pixelated:", img_final.size)

# Mirror horizontally
img_final = img_final.transpose(Image.FLIP_LEFT_RIGHT)
print("Mirrored:", img_final.size)

img_final.save(dst, "PNG")
print("Saved:", dst, os.path.getsize(dst), "bytes")
