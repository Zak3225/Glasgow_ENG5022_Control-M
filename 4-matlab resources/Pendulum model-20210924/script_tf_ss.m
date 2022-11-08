%% PARAMETERS
g = 9.81; %m/s^2

m = 5;    %kg
l = 0.4;  %m
c = 0.5;  %Nm/rad

I=m*(l/2)^2;

wn=sqrt(m*g*l/(2*I));
xi=c/(2*I*wn);

%% TRANSFER FUNCTION
sys_tf=tf(1/I,[1 2*xi*wn wn^2]);

%% STATE SPACE SYSTEM
A=[-2*xi*wn -wn^2
    1     0];
B=[ 1
    0];
C=[0 1/I];
D=0;

sys_ss=ss(A,B,C,D);
