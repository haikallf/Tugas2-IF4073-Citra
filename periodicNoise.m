function [inputImage, fSpec, outputImage] = periodicNoise(noiseImageOption)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

switch noiseImageOption
    case "Noise A"
        img = imread("./img/4-1-1.png");
    case "Noise B"
       img = imread("./img/4-2-1.png");
    case "Noise C"
        img = imread("./img/4-3-1.png");
    case "Noise D"
        img = imread("./img/4-4-1.png");
    otherwise
        img = imread("./img/4-1-1.png");
end

img = im2gray(img);
[x, y] = size(img);
disp(x);
disp(y);

inputImage = img;

f = fft2(img);
fShift = fftshift(f);
fSpec = log(abs(fShift) + 1);

switch noiseImageOption
    case "Noise A"
        for i=175:190
            for j=55:70
                fShift(i, j) = 0;
            end
            for j=175:190
                fShift(i, j) = 0;
            end
        end
    case "Noise B"
       fShift = medfil(fShift);
    case "Noise C"
        fShift(145:x, 1:250) = 0;
        fShift(1:250, 155:y) = 0;
    case "Noise D"
        disp("Belum");
    otherwise
        disp("Belum");
end

outputImage = real(ifft2(ifftshift(fShift)));

end