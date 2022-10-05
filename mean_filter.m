function  meaned  = mean_filter(img, Mask)
    [x,y,z] = size(img);
    [a,b] = size(Mask);

    meaned = zeros(x-(a-1), y-(b-1), z);
    for i = 1 : z
        meaned(:, :, i) = convolution_mult(img(:, :, i) , Mask);
    end

    meaned = cast(convoluted, 'like', img); %turn it to uint8 form instead of double
end
