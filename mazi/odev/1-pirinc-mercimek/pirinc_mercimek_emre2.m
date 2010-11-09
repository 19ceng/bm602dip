% Bu algoritma; "alanlari ayni ama buyuk eksen uzunluklari farkli", "buyuk
% eksen uzunluklari ayni ama alanlari farkli" ve "alanlari ve buyuk eksen
% uzunluklari farkli" olan sekilleri birbirinden ayirt ederek bunlarin resim
% icerisindeki sayilarini bulma problemine komple bir cozum sunar.
% Algoritma, siyah arkaplan uzerinde bulunan iki farkli turdeki beyaz
% tanecikleri ayirt edecek sekilde tasarlanmistir.
% Yazar: Emre Gurbuz

clear all; close all; clc;

%Halihazirda siyah-beyaz olan resim okunur
bw = imread('pirinc_mercimek.jpg');

%Okunan resimdeki her bir farkli tanecik, farkli bir rakamla isaretlenerek
%"L" matrisine atilir.
L = bwlabel(bw);

%L matrisinde yer alan her bir "ortak numerik degere sahip olan komsu
%karelerin olusturdugu sekil" e ait major eksen uzunluklari, 
%"MajorAxisLength" icerisinde tutulmaktadir.
s = regionprops(L, {'majoraxislength', 'minoraxislength'});
MajorAxisLength = cat(1, s.MajorAxisLength);
MinorAxisLength = cat(1, s.MinorAxisLength);

oran = MajorAxisLength ./ MinorAxisLength;

mx = max(oran); mn = min(oran); 
esik = (mx + mn)/2;

PirincSayisi = sum(oran > esik);
MercimekSayisi = sum(oran < esik);

fprintf('%s : %d adet\n', 'Pirinç  ', int32(PirincSayisi));
fprintf('%s : %d adet\n', 'Mercimek', int32(MercimekSayisi));

%Emre Gürbüz (09210148)
