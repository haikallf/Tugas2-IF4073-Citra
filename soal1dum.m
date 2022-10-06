Mask = [0 -1 0; 0 5 -1; 0 -1 0];
img = imread('img\butter2.png');

filteredImage = processing_convo(img);

figure(2);
imshow(filteredImage);
title('Manual convolution (zero-padding)');


solution = zeros(x-2, y-2, z);
for i = 1 : z
    solution(:, :, i) = conv2(img(:, :, i), Mask, 'valid');
end


solution = cast(solution, 'like', img); %turn it to uint8 form instead of double
figure(1);
imshow(solution);