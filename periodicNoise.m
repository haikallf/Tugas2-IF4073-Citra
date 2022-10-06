function [inputImage, fSpec, outputImage] = periodicNoise(noiseImageOption)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

switch noiseImageOption
    case "Noise A"
        img = imread("./img/6-1.png");
    case "Noise B"
       img = imread("./img/6-2.png");
    case "Noise C"
        img = imread("./img/6-3.png");
    case "Noise D"
        img = imread("./img/6-4.png");
    otherwise
        img = imread("./img/6-1.png");
end

img = im2gray(img);
[x, y] = size(img);

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
       for i=100:250
            for j=210:255
                fShift(i, j) = 0;
            end
       end
       for i=270:440
            for j=210:255
                fShift(i, j) = 0;
            end
        end
    case "Noise C"
        fShift(145:x, 1:250) = 0;
        fShift(1:250, 155:y) = 0;
    case "Noise D"
        for i=1:240
            for j=330:340
                fShift(i, j) = 0;
            end
        end
    otherwise
        for i=175:190
            for j=55:70
                fShift(i, j) = 0;
            end
            for j=175:190
                fShift(i, j) = 0;
            end
        end
end

outputImage = real(ifft2(ifftshift(fShift)));

end