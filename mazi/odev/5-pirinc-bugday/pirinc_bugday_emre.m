bw = imread('pirincbugday.bmp');
L = bwlabel(bw);

%Pirinc ve Bugday sayilari
Pirinc = 0;
Bugday = 0;

%Bugdaylarin daha buyuk oldugunu kabul ediyoruz.


%Arkaplan 0 lardan olusuyor zaten, bizi ilgilendiren, 0'dan buyuk sayilar.

BuyukTanelerinAlani = 0;
KucukTanelerinAlani = 0;

%Artik ilk gordugu sekil pirincse de bugdaysa da onu alani en buyuk sekil olarak
%kabul ederiz ilk basta, sonra da alan olarak daha buyugu cikarsa degistiririz.
BuyukTanelerinAlani = length( find( L == 1) );

for i=1:max(L(:)) % 27 parca vardi mesela
    %Ilk karsimiza cikan seklin alanini en buyuk kabul etmistik ya, burada
    %tum resim taranir, eger daha buyuk alanli bir sekille karsilasilirsa,
    %eldeki alan "kucuk", karsilasilan yeni alan ise "buyuk" olarak
    %nitelendirilir.
    if (length( find( L == i) ) > BuyukTanelerinAlani)
        KucukTanelerinAlani = BuyukTanelerinAlani;
        BuyukTanelerinAlani = length( find( L == i) );
    end
end

for i=1:max(L(:))
    if (length( find( L == i) ) == BuyukTanelerinAlani)
        Bugday = Bugday + 1;
    else
        Pirinc = Pirinc + 1;
    end
end

%Sonuna noktali virgul koymayýnca komut ekranýnda gorulebilir.
Bugday
Pirinc

%Emre Gurbuz (09210148)