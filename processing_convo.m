function  convoluted  = processing_convo(img, Mask)
    [x,y,z] = size(img);
    [a,b] = size(Mask);

    convoluted = zeros(x-(a-1), y-(b-1), z);
    for i = 1 : z
        convoluted(:, :, i) = convolution_mult(img(:, :, i) , Mask);
    end

    convoluted = cast(convoluted, 'like', img); %turn it to uint8 form instead of double
end