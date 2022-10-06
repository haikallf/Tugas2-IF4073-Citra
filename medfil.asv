function outputImage = medfil(img)
[x, y] = size(img);
outputImg = zeros(x, y);
for i = 2 : x-1
    for j = 2 : y-1
        temp=[img(i-1, j-1), img(i-1, j), img(i-1, j+1), img(i, j-1), img(i, j), img(i, j+1), img(i+1, j-1),img(i+1, j),img(i+1, j+1)];
        temp=sort(temp);
        outputImg(i, j) = temp(5);
    end
end

outputImage = outputImg;
end
