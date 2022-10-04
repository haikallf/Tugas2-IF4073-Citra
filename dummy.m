
matrix = [4 4 3 5 4; 6 6 5 5 2; 5 6 6 6 2; 6 7 5 5 3; 3 5 2 4 4];
kernel = [0 -1 0; -1 4 -1; 0 -1 0];
conv = multiply_convolution(matrix, kernel)