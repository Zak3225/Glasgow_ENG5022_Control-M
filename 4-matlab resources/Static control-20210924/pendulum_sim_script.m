
%% Script to initialise parameters for pendulum model
% This script needs to be executed before running pendulum_sim.mdl,
% openloop.mdl or closedloop.mdl

g = 9.81; %m/s^2, gravitational constant

m = 5;    %kg, mass
l = 0.4;  %m, length
c = 2;  %Nm/rad, damping

I=m*(l/2)^2; %moment of inertia

%% Implement model as linear transfer function
wn=sqrt(m*g*l/(2*I));  % natural frequency
xi=c/(2*I*wn);         % damping coefficient

% calculate the linear plant transfer function
Po = tf(1/I, [1 2*xi*wn wn^2])
