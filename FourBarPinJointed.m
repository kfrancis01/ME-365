%Four Bar Pin Jointed
clc; clear all
a = 20; %mm
b = 220; %mm
c = 150; %mm
d = 100; %mm

th2=30;
w2=50;

K_1=d./a;
K_2=d./c;
K_3=(a.^2-b.^2+c.^2+d.^2)./(2.*a.*c);
B=-2.*sind(th2);
A=cosd(th2)-K_1-K_2.*cosd(th2)+K_3;
C=K_1-(K_2+1).*cosd(th2)+K_3;
wm=(-B-sqrt(B.^2-4.*A.*C))./(2.*A);
wp=(-B+sqrt(B.^2-4.*A.*C))./(2.*A);
th4m=2.*atand(wm)
th4p=2.*atand(wp);
K_4=d./b;
K_5=(c.^2-d.^2-a.^2-b.^2)./(2.*a.*b);
D=cosd(th2)-K_1+K_4.*cosd(th2)+K_5;
E=-2.*sind(th2);
F=K_1+(K_4-1).*cosd(th2)+K_5;
pm=(-E-sqrt(E.^2 -4.*D.*F))./(2.*D);
pp=(-E+sqrt(E.^2 -4.*D.*F))./(2.*D);
th3m=2.*atand(pm)
th3p=2.*atand(pp);
%%
w4=(a.*w2.*sind(th2)-a.*w2.*tand(th3m).*cosd(th2))./(-tand(th3m).*c.*cosd(th4m)+c.*sind(th4m))
w3=(c.*w4.*cosd(th4m)-a.*w2.*cosd(th2))./(b.*cosd(th3m))
%%
%acceleration
squiggly_fish2=0;
A1=c.*sind(th4m);
B1=b.*sind(th3m);
C1=a.*squiggly_fish2.*sind(th2)+a.*(w2.^2).*cosd(th2)+b.*(w3.^2).*cosd(th3m)-c.*(w4.^2).*cosd(th4m);
D1=c.*cosd(th4m);
E1=b.*cosd(th3m);
F1=a.*squiggly_fish2.*cosd(th2)-a.*(w2.^2).*sind(th2)-b.*(w3.^2).*sind(th3m)+c.*(w4.^2).*sind(th4m);
alpha3=(C1.*D1-A1.*F1)./(A1.*E1-B1.*D1)
alpha4=(C1.*E1-B1.*F1)./(A1.*E1-B1.*D1)
