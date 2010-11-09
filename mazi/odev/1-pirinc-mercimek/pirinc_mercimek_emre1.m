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

%Pirinc ve Mercimek sayilari ilk basta 0 olacaktir.
Pirinc = 0;
Mercimek = 0;

%Pirinclerin daha buyuk oldugunu bilmekteyiz. Hem alan olarak, hem de
%eksen uzunlugu olarak pirincleri buyuk kabul ediyoruz.
%Arkaplansa 0 lardan olusuyor zaten, bizi ilgilendiren, 0'dan buyuk sayilar.

%Buyuk ve kucuk taneciklerin kapladiklari alanlar
BuyukTanelerinAlani = 0;
KucukTanelerinAlani = 0;%Gerek duyuldugu takdirde yazdirmak icin

%Uzun ve kisa taneciklerin kapladiklari alanlar
UzunTanelerinMajoru = 0;
KisaTanelerinMajoru = 0;%Gerek duyuldugu takdirde yazdirmak icin

%Ilk karsimiza cikan seklin buyuk ve uzun oldugunu dusunelim ve butun
%resmi gezelim. Eger daha buyugu ve uzunu cikarsa, alttaki degerleri
%guncelleriz.
BuyukTanelerinAlani = length( find( L == 1) );
UzunTanelerinMajoru = MajorAxisLength(1);

for i=1:max(L(:))
%Tum resmi gez ve "buyuk tanelerin alanlari" ni, "kucuk tanelerin alanlari"
%ni, "uzun tanelerin eksen uzunluklari" ni ve "kisa tanelerin eksen
%uzunluklari" ni guncel ve dogru halleri ile kaydet.
    if (length( find( L == i) ) > BuyukTanelerinAlani)
        KucukTanelerinAlani = BuyukTanelerinAlani;
        BuyukTanelerinAlani = length( find( L == i) );
    end
    
    if (MajorAxisLength(i) > UzunTanelerinMajoru)
        KisaTanelerinMajoru = UzunTanelerinMajoru;
        UzunTanelerinMajoru = MajorAxisLength(i);
    end
end

for i=1:max(L(:))
    %Tum resmi yeniden gez. Buyuk ve uzun tanecikler icin pirinc sayisini,
    %kucuk ve kisa tanecikler icinse mercimek sayisini 1 artir.
    if (length( find( L == i) ) == BuyukTanelerinAlani && MajorAxisLength(i) == UzunTanelerinMajoru)
        Pirinc = Pirinc + 1;
    else
        Mercimek = Mercimek + 1;
    end
end

fprintf('%s : %d adet\n', 'Pirinç  ', int32(Pirinc));
fprintf('%s : %d adet\n', 'Mercimek', int32(Mercimek));

%Emre Gürbüz (09210148)
