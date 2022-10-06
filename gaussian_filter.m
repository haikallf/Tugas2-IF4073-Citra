function  gaussed  = gaussian_filter(img, sigma)
    n = 5*sigma;

    [x,y,z] = size(img);

    gauss_filter = fspecial('gaussian',n, sigma);
    [a,b] = size(gauss_filter);
    
    gaussed = zeros(x-(a-1), y-(b-1), z);
    for i = 1 : z
        gaussed(:, :, i) = convolution_mult(img(:, :, i) , gauss_filter);
    end

    gaussed = cast(gaussed, 'like', img); %turn it to uint8 form instead of double
end
