function glpf_smooth = glpf(img,d0)
    [x,y] = size(img);
    %Step 1: Tentukan parameter padding, biasanya untuk citra f(x,y)
    % berukuran M x N, parameter padding P dan Q adalah P = 2M and Q = 2N.
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
    %imshow(img);
    %title('original image');
    
    % Fourier Spectrum
    Fc=fftshift(fft2(padded_img));
    S2=log(1+abs(Fc));
    %figure, imshow(S2,[]); title('Fourier spectrum');

    % Fourier transformation
    Fourier = fft2(double(padded_img));

    % glpf
    % Set up range of variables.
    u = 0:(p-1);
    v = 0:(q-1);
    % Compute the indices for use in meshgrid
    idx = find(u > p/2);
    u(idx) = u(idx) - p;
    idy = find(v > q/2);
    v(idy) = v(idy) - q;
    
    % Compute the meshgrid arrays
    [V, U] = meshgrid(v, u);
    d = sqrt(U.^2 + V.^2);
    h =  exp(-(d.^2)./(2*(d0^2)));
    h = fftshift(h);

    %Step 5: Kalikan F dengan H
    h = ifftshift(h);
    lpf_multf = h.*Fourier;

    %Step 6: Ambil bagian real dari inverse FFT of G:
    lpf_multf2=real(ifft2(lpf_multf)); % apply the inverse, discrete Fourier transform
    
    %Step 7: Potong bagian kiri atas sehingga menjadi berukuran citra semula
    glpf_smooth=lpf_multf2(1:x, 1:y); % Resize the image to undo padding
end