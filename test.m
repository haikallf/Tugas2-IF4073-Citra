img = imread('C:\Users\haika\Documents\Semester 7\Pengcit\Tugas 2\img\test.png');

Mask = [0, 0, 1; 0, 0, 0; 0, 0, 0; 0, 0, 0];

[x, y, z] = size(img);
B = zeros(x, y, 'uint8');
for i = 2 : x-3
    for j = 2 : y-3
          B(i, j) = img(i-1, j-1) * Mask(1, 1) + img(i-1, j+1) * Mask(1, 2) + img(i-1, j) * Mask(1, 3) + img(i, j-1) * Mask(2, 1) + img(i, j) * Mask(2, 2) + img(i, j+1) * Mask(2, 3) + img(i+1, j-1) * Mask(3, 1) + img(i+1, j) * Mask(3, 2) + img(i+1, j+1) * Mask(3, 3);
    end
end

imshow(B, []);

