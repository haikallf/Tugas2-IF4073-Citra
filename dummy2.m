
img = imread('img\butter2.png');

imshow(img);
title('original');
figure;

n=2;
img = img + 15*n;

imshow(img);
title('brigthened');