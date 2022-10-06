function glpf_smooth = glpf(img,d0)
    [x,y] = size(img);
    
    % padding
    p = 2*x;
    q = 2*y;
    
    padded_img = zeros(p,q);

    img = im2double(img);
    for i = 1:p
        for j = 1:q
            if i <= x && j<= y
                padded_img(i,j) = img(i,j);
            end
        end
    end
    
    % Fourier Spectrum
    Fc=fftshift(fft2(padded_img));
    S2=log(1+abs(Fc));

    % Fourier transformation
    Fourier = fft2(double(padded_img));

    % glpf
    u = 0:(p-1);
    v = 0:(q-1);
    
    % meshgrid indices
    idx = find(u > p/2);
    u(idx) = u(idx) - p;
    idy = find(v > q/2);
    v(idy) = v(idy) - q;
    
    % meshgrid arrays
    [V, U] = meshgrid(v, u);
    d = sqrt(U.^2 + V.^2);
    h =  exp(-(d.^2)./(2*(d0^2)));
    h = fftshift(h);

    h = ifftshift(h);
    lpf_multf = h.*Fourier;

    lpf_multf2=real(ifft2(lpf_multf)); % apply inverse
    
    %del padding
    glpf_smooth=lpf_multf2(1:x, 1:y); 
end