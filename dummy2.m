clear
clc

matrix = randi([0, 255], [756,435])
[x,y] = size(matrix);
kernel = [0 -1 0; -1 10 -1; 0 -1 0];
mat1 = multiply_convolution(matrix, kernel);
mat1 = round(mat1,4);
mat2 = conv2(matrix, kernel, 'valid');
mat2 = round(mat2,4);
isequal(mat1,mat2)