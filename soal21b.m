sigma = 8;
img = imread('img\butter2.png');

gaussed_Image = gaussian_filter(img, sigma);
imshow(gaussed_Image)