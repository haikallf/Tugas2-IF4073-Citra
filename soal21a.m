Mask = ones(8);
Mask = Mask/(length(Mask)*length(Mask))
img = imread('img\butter2.png');

meaned_Image = processing_convo(img, Mask);

figure(2);
imshow(meaned_Image);
title('Manual convolution (zero-padding)');


solution = zeros(x-length(Mask)+1, y-length(Mask)+1, z);
for i = 1 : z
    solution(:, :, i) = conv2(img(:, :, i), Mask, 'valid');
end


solution = cast(solution, 'like', img); %turn it to uint8 form instead of double
figure(1);
imshow(solution);