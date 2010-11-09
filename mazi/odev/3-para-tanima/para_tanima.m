close all;
clear all;
clc;

OneDime = 0;
OneCent = 0;
FiveCent = 0;
QuarterDollar = 0;

img = imread('paraABD.jpg');
rgb = img;
img = 255 - img;

level = graythresh(img);

bw = im2bw(img, 0.08);

% BW2 = imfill(bw);
warning off all;
dip_initialise('silent');

a = dip_image(bw);
b = bdilation(a,1,-1,0);
c = berosion(b,1,-1,1);
BW2 = berosion(c,1,-1,1);

bw3 = logical(BW2);

L = bwlabel(bw3);
s = regionprops(L, {'area'});
c = regionprops(L, {'centroid'});

imshow(rgb);

for i=1:max(L(:))
    if(2609 < s(i).Area && s(i).Area < 2809)
        OneDime = OneDime + 1;
        text(c(i).Centroid(1), c(i).Centroid(2), 'One Dime');
    elseif (2995 < s(i).Area && s(i).Area < 3195)
        OneCent = OneCent + 1;
        text(c(i).Centroid(1), c(i).Centroid(2), 'One Cent');
    elseif (3682 < s(i).Area && s(i).Area < 3882)
        FiveCent = FiveCent + 1;
        text(c(i).Centroid(1), c(i).Centroid(2), 'Five Cent');
    elseif (4867 < s(i).Area && s(i).Area < 5067)
        QuarterDollar = QuarterDollar + 1;
        text(c(i).Centroid(1), c(i).Centroid(2), 'Quarter Dollar');
    end
end

fprintf('%s : %d %s\n', 'One Dime      ', OneDime, 'tane var.');
fprintf('%s : %d %s\n', 'One Cent      ', OneCent, 'tane var.');
fprintf('%s : %d %s\n', 'Five Cent     ', OneDime, 'tane var.');
fprintf('%s : %d %s\n', 'Quarter Dollar', OneDime, 'tane var.');

% subplot(1, 2, 1), imshow(rgb);
% subplot(1, 2, 2), imshow(bw3);

L = bwlabel(bw3, 8);
% L = bwlabel(BW2, 8);

%fprintf('%s : %f','fgh', double(level));
