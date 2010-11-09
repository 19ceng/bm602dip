close all; clear all; clc;

BugdaySayisi = 0;

img = imread('arpa_para.jpg');
renkli = img;

%level = graythresh(img);
bw = im2bw(renkli, 0.44);
warning off all;
dip_image;
dip_initialise('silent');

bw = imfill(bw,'holes');
a = dip_image(bw);
a = berosion(a,5,2,0);
a = bdilation(a,5,2,0);
a = logical(a);
a=imfill(a,'holes');
paralar = logical(a);

figure(1), imshow(paralar);


bugdaylar = bw;
[satir sutun] = size(bugdaylar);

for i=1:satir
   for j=1:sutun
       if (paralar(i, j) == 1)
           bugdaylar(i, j) = 0;
       end
   end
end

b=dip_image(bugdaylar);
b = berosion(b,2,-2,0);
b = berosion(b,1,2,0);
b = bdilation(b,1,2,0);
b = berosion(b,1,-1,0);
b = bdilation(b,1,-1,0);
bugdaylar = logical(b);

figure(2), imshow(bugdaylar);


L = bwlabel(bugdaylar);
BugdaySayisi = max(L(:));

L = bwlabel(paralar);
s = regionprops(L, {'area'});
AlanSayisi = size(s, 1);

for i=1:AlanSayisi
    alanlar(i) = s(i).Area;
end

BirTlAlan = max(alanlar(:));%En buyuk paranin 1 TL oldugunu kabul ettik.
ToplamKurus = 0;

for i=1:AlanSayisi
   if (1 >= (alanlar(i) / BirTlAlan) && (alanlar(i) / BirTlAlan) > 0.95)
       ToplamKurus = ToplamKurus + 100;
   elseif (0.95 >= (alanlar(i) / BirTlAlan) && (alanlar(i) / BirTlAlan) > 0.75)
       ToplamKurus = ToplamKurus + 50;  
   elseif (0.75 >= (alanlar(i) / BirTlAlan) && (alanlar(i) / BirTlAlan) > 0.55)
        ToplamKurus = ToplamKurus + 25;         
   elseif (0.55 >= (alanlar(i) / BirTlAlan) && (alanlar(i) / BirTlAlan) > 0.4)
        ToplamKurus = ToplamKurus + 10; 
   end
end

TL = floor(ToplamKurus / 100);
Kr = mod(ToplamKurus, 100);

fprintf('%s : %d\n', 'Buðday Sayýsý', BugdaySayisi);
fprintf('%s : %d TL  %d Kr\n', 'Toplam Para  ', TL, Kr);


% Emre Gürbüz (09210148)
