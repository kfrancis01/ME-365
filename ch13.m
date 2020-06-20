clear
clc 
format short 

%Conversions
conp2m = 1/32.2; %convert pound weight to mass
coni2f = 1/12; %conver inches to feet
convert = (2*pi())/60;%rpm to rad/s
%convert2 = ;%blob to (lbf*sec^2)/in

%Lump Mass Method
m3 = 20*conp2m;
mp = 25*conp2m; % m3*(lb/(lp+lb));
m2 = 12*conp2m; % m2a + m2O2;
%lp = Ig3/(m3*lb);
la = 4; % r3a*l
lb = 8;
r = 0.2;
rg2 = -2; %r2a*r
%m2O2 = ;
m2a = m2*(rg2/r);
m3a = m3*(lb/(la+lb));
m3b = m3*(la/(la+lb));
Ig3_approx = (m3a*la^2)+(m3b*lb^2);
ma = m2a +m3a;
%mb = m3b + mp; % m3*(lp/(lp+lb))
mb = 5;

%Displacement, Velocity, Acceleration
w = 10;
%t = ;
r = 3;
l = 12; %arm length
%phi = ;
angle = 30; %angle = w*t;
q = r*sind(angle); %or l*sin(phi)
s = r*cosd(angle);
%u = l*cosd(phi);
%x1 = s + u;
%x2 = r*cosd(angle)+(l*cosd(phi));%should be the same as x1
x_approx = l-((r^2)/(4*l))+(r*(cos(angle)+((r/(4*l))*cos(2*angle))));

x_dot = -r*w*(sind(angle)+((r/(2*l))*(sind(2*angle)/sqrt(1-((r*sind(angle))/l)^2))));
x_dotapprox = -r*w*(sind(angle)+((r/(2*l))*sind(2*angle)));

%x_ddot = ;
x_ddotapprox = (r*coni2f)*(w^2)*(cosd(angle)+((r/l)*cosd(2*angle)));

%Shaking/Inertia Force
Fsa = ma*(r/l)*w^2;
Fsax = Fsa*(-cosd(angle));
Fsay = Fsa*sind(angle);

Fsbx = mb*x_ddotapprox; %x direction

Fsx = Fsax+Fsbx;
Fsy = Fsay;

Fs = sqrt((Fsx^2)+Fsy^2);
%angle_Fs = arctand(Fsy/Fsx);

%shaking force for four cylinder engine
phi1 = 0;
phi2 = 180;
phi3 = 0;
phi4 = 180;
phi = [phi1 phi2 phi3 phi4];

for i = [1:4]
    Fshaking = (mb*r*w^2)*((cosd(angle)*cosd(phi(i)))+(sind(angle)*sind(phi(i)))+((r/l)*(cosd(2*angle)*cosd(2*phi(i))+sind(2*angle)*sind(2*phi))));
end

%Inertia/Shaking Torque
T12 = Fsbx*((r/(2*l))+cosd(angle)+((r/(2*l))*cosd(2*angle)));

%Error = (Ig3_approx-Ig3)/Ig3;
%correct = (3/12)*(w^2)*(cos());
correctFsa = 0.1666*(3/12)*((300*2*pi())/60)^2;