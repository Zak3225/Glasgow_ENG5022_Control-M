%% Script to initialise parameters for pendulum model and set PID
%% controller parameters
% This script needs to be executed before running closedloop_pid.mdl,


g = 9.81; %m/s^2, gravitational constant

m = 5;    %kg, mass
l = 0.4;  %m, length
c = 2.5;  %Nm/rad, damping

I=m*(l/2)^2; %moment of inertia

%% Implement model as linear transfer function
wn=sqrt(m*g*l/(2*I));  % natural frequency
xi=c/(2*I*wn);         % damping coefficient

% calculate the linear plant transfer function

Ao=[1 2*xi*wn wn^2];
Bo=1/I;
Po=tf(Bo,Ao);

%% Set the PID controller
CP=40;
CI=tf(50,[1 0]);
CD=tf([8 0],[1/100 1]);

C=CP+CI+CD;

%% load the actuator models
load actuator_models

