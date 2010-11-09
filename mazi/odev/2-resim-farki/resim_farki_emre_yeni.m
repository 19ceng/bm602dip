rgb1 = imread('fark1.jpg');
rgb2 = imread('fark2.jpg');

pict1_R = rgb1(:, :, 1);
pict2_R = rgb2(:, :, 1);
pict1_G = rgb1(:, :, 2);
pict2_G = rgb2(:, :, 2);
pict1_B = rgb1(:, :, 3);
pict2_B = rgb2(:, :, 3);

sonuc_R = abs(pict1_R - pict2_R);
sonuc_G = abs(pict1_G - pict2_G);
sonuc_B = abs(pict1_B - pict2_B);

final = sonuc_R + sonuc_G + sonuc_B;

subplot(1, 3, 1), imshow(rgb1);
subplot(1, 3, 2), imshow(rgb2);
subplot(1, 3, 3), imshow(final);
