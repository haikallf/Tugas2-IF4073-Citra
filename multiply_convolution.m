function conv_product = multiply_convolution(mat, ker)
    [x,y] = size(mat);
    [a,b] = size(ker);
    row_size = (x-(a-1));
    col_size = (y-(b-1));
    
    conv_product = zeros(row_size,col_size);
    
    for i = 1:row_size
        for j= 1:col_size
            sum = 0;
            for k = 1:a
                for l=1:b
                    sum = sum + mat(i+k-1,j+l-1)*ker(k,l);
                end
            end
            conv_product(i,j) = sum;
        end
    end
end
