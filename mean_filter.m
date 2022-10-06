function  meaned  = mean_filter(img,fil_size)
    fil_size
    Mask = ones(fil_size);
    Mask = Mask/(length(Mask)*length(Mask));
    [x,y,z] = size(img);
    [a,b] = size(Mask);

    meaned = zeros(x-(a-1), y-(b-1), z);
    for i = 1 : z
        meaned(:, :, i) = convolution_mult(img(:, :, i) , Mask);
    end

    meaned = cast(meaned, 'like', img); %turn it to uint8 form instead of double
end
