function [outputImg, fSpec] = bhpf(img, n)
[x, y, z] = size(img);

x_ = 2 * x;
y_ = 2 * y;

doubledImg = im2double(img);
paddedImage = zeros(x_, y_);
for i = 1 : x_
    for j = 1 : y_
        if i <= x && j<= y
            paddedImage(i,j) = doubledImg(i,j);
        else
            paddedImage(i,j) = 0;
        end
    end
end

fTrans = fft2(double(paddedImage));

D0 = 0.05 * x_;

p = 0 : (x_ - 1);
q = 0 : (y_ - 1);

id_x = find(p > (x_ / 2));
p(id_x) = p(id_x) - x_;
id_y = find(q > (x_ / 2));
q(id_y) = q(id_y) - y_;

[Q, P] = meshgrid(q, p);
D = sqrt(P.^2 + Q.^2);

n = 2 * n;
HPF = 1 ./ (1 + (D0./D).^n);

HPF_fTrans = HPF.*fTrans;
outputImage = real(ifft2(HPF_fTrans));

outputImage = outputImage(1 : x, 1 : y);

outputImg = outputImage;


fVal = fftshift(fft2(paddedImage));
fSpec = log(1 + abs(fVal));
end