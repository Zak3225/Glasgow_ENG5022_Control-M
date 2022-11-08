%% parameters of pendulum model
g = 9.81; %m/s^2

m = 5;    %kg
l = 0.4;  %m
c = 10;  %Nm/rad

I=m*(l/2)^2;

wn=sqrt(m*g*l/(2*I));
xi=c/(2*I*wn);

%% transfer function
sys_tf=tf(1/I,[1 2*xi*wn wn^2]);

%% state space representation
    A=[-2*xi*wn -wn^2
        1     0];
    B=[1
        0];
    C=[0 1/I];
    D=0;

    sys_ss=ss(A,B,C,D);

%% Design a state feedback controller with closed loop poles at -6 and -5
%  feedback gain vector is K
K=place(A,B,[-6 -5]);
%% Calculate the corresponding gain for the reference input
%  gain for reference input is N
[N_]=inv([A B; [C D]])*[zeros(length(A),1);1];
Nx=N_(1:length(A));
Nu=N_(length(A)+1:end);
N=Nu+K*Nx;

%% Design a controller with rise time tr and overshoot Mp
%  feedback gain vector is K1
%  gain for reference input is N1
tr=.1;
Mp=.1;
wn=1.8/tr;
xi=-log(Mp)/sqrt(pi^2+log(Mp)^2);
Acl=[1 2*wn*xi wn^2];
p=roots(Acl);
K1=place(A,B,p);
N1=Nu+K1*Nx;

%% Design an observer (estimator) with two poles at -20
p_obsv=[-20 -20];
L=acker(A',C',p_obsv)';