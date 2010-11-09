clear all; close all; clc;
EDmthds = {'sobel' 'prewitt' 'roberts' 'log' 'zerocross' 'canny'};
PictS   = {'BugMer.bmp', 'building.jpg', 'text.jpg'};
for i=1:size(PictS, 2)
    I = imread(char(PictS(i)));
    for j=1:size(EDmthds, 2)
       BWs = edge(I,char(EDmthds(j)));
       figure((j + (i-1)*size(EDmthds, 2))), imshow(BWs), title(strcat(char(PictS(i)),'-->' , char(EDmthds(j))));
    end
end
% Tum resimler gorev cubugunda ayri ayri cikacaktir. Her birini tam ekran
% yapmaniz, gerekli gorurseniz ayrica buyutec de kullanmaniz tavsiye
% edilir.

% Emre Gurbuz (09210148)