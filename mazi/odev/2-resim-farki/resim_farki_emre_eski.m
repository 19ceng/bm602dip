rgb1 = imread('fark1.jpg');
rgb2 = imread('fark2.jpg');

gray1 = rgb2gray(rgb1);
gray2 = rgb2gray(rgb2);

sonuc = abs(gray1 - gray2);

subplot(1, 3, 1), imshow(rgb1);
subplot(1, 3, 2), imshow(rgb2);
subplot(1, 3, 3), imshow(sonuc);
