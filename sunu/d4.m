img = imread('cameraman.tif');
imshow(img)
f = fft2(double(img));
f2 = fftshift(f));

imagesc(log(abs(f2))

j = uint8(ifft2(f));
imshow(j)

fark = uint8(10*abs(double(img) - double(j)));
imshow(fark)