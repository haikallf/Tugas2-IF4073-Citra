
img = imread('img\butter2.png');
img = im2gray(img);
smoothed_ilpf = ilpf(img,50);
smoothed_glpf = glpf(img,50);

smoothed_blpf = blpf(img,50,1);

figure, imshow(smoothed_ilpf); 
title('ilpf');
figure, imshow(smoothed_glpf); 
title('glpf');

figure, imshow(smoothed_blpf); 
title('blpf');