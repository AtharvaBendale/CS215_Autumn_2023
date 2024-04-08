clear IMAGE_1 IMAGE_2 QMI COR r c
IMAGE_1 = double(imread('./T1.jpg'));
IMAGE_2 = 255 - IMAGE_1;
[r, c] = size(IMAGE_1);