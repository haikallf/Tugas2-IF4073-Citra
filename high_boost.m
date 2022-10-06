function boosted = high_boost(img, alfa)
    G = [1/25 1/25 1/25 1/25 1/25;
    1/25 1/25 1/25 1/25 1/25;
    1/25 1/25 1/25 1/25 1/25;
    1/25 1/25 1/25 1/25 1/25;
    1/25 1/25 1/25 1/25 1/25];
    Lowpass = uint8(convn(double(img),double(G), 'same'));
    Highpass = img - Lowpass;
    Isharp = (alfa - 1)*img + Highpass;
    boosted = Isharp;
end
