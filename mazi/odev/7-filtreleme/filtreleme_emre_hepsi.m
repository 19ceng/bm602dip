clear all; close all; clc;
EDmthds = {'sobel' 'prewitt' 'roberts' 'log' 'zerocross' 'canny'};
PictS   = {'BugMer.bmp', 'building.jpg', 'text.jpg'};
for i=1:size(PictS, 2)
    I = imread(char(PictS(i)));
    for j=1:size(EDmthds, 2)
       BWs = edge(I,char(EDmthds(j)));
       subplot(size(PictS, 2), size(EDmthds, 2), (j + (i-1)*size(EDmthds, 2))), imshow(BWs), title(strcat(char(PictS(i)),'-->' , char(EDmthds(j))));
    end
end
% Cikan sonuc resmini tam ekran yapmaniz ve her bir alt resim icin buyutecle
% yaklastirma islemi yapmaniz (2-4 kez) tavsiye edilir.

%Emre Gurbuz (09210148)