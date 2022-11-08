%%
% *Control M Lab1 report*
% 
% * Student Name: Ankai Zhang 
% * Student ID: 2710818Z

% a description of the a done in the lab, explaining the tools and methods used,
% a summary of the results obtained and the observations made, including all plots required in the lab sheet,
% a discussion of what other methods could be used to improve the results.

%%
% *1.1.1 System Modelling* 
% *QUBE Servo 2 system parameters* 

Rm = 8.4;
kt = 0.042;
km = 0.042;
Jm = 4e-6;
Lm = 1.16;
mh = 0.0106;
rh = 0.0111;
md = 0.053;
rd = 0.0248;
Jeq = 0.5*mh*rh*rh + 0.5*md*rd*rd;

% Q1.1: Take the Laplace transform of this equation and derive the transfer function
num_g = [kt];
den_g =[Jeq*Rm kt*km];
g = tf(num_g,den_g);

% Q1.2: Write down the resulting transfer function in monic form:
a = 1/(Jeq*Rm);
num_g_monic = [kt*a];
den_g_monic = [1 a*kt*km];
g_monic = tf(num_g_monic, den_g_monic);

% Q1.3: What are the poles and the zeros of the plant transfer function?
[z,p,k] = tf2zp(num_g_monic, den_g_monic);

plot(out.ScopeData.time, out.ScopeData.signals(2).values);
hold on
plot(out.ScopeData.time, out.ScopeData.signals(1).values);
hold off


