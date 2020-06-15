clear
clc

%Gear Formula Method
N2 = 30;
N3 = 25;
N4 = 45;
N5 = 30;
N6 = 160;

w2 = 50;
w_arm = -75;

wF = w2;
wA = w_arm;

R = (-N2/N4)*(-N3/N5)*(N5/N6); %change ratio depending on what velocity you want to find
wL = (R*(wF-wA))+wA; %angular velocity of gear you want to find