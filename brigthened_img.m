function bright = brigthened_img(img,alfa)
    [x,y,z] = size(img);

    bright = zeros(x, y, z);
    for i = 1 : z
        bright(:, :, i) = high_boost(img(:, :, i) , alfa);
    end

    bright = cast(bright, 'like', img); %turn it to uint8 form instead of double
end