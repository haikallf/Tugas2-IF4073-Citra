function  convImage  = convolution_mult(img, kernel)
filterSize = length(kernel);
[rows, columns] = size(img);
for col = 1 : columns - (filterSize-1)
	for row = 1 : rows -(filterSize-1)
		new_el = 0; 
		for c = 1 : filterSize
			ic = col + c- 1;
			for r = 1 : filterSize
				ir = row + r - 1;
				new_el = new_el + double(img(ir, ic)) * kernel(r, c);
			end
        end
		convImage(row, col) = new_el;
	end
end
