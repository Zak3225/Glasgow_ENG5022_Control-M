%%
% solve frequency response
clc
clear all
e = exp(1)

w = 0.5
t = 2
s = j*w
s = tf('s')
g = 20/((s-1)*(s-2))

s = zpk('s')

g = 0.058*(s+1)^2/((s-1.105)*(s-1.221))

gzm = c2d(g, 2, 'matched')
gzpk = zpk(c2d(g, 0.1, 'tustin'))
m = (0.05848*(z+1)^2)/((z-1.222)* (z-1.105))

gain = sqrt(g*g)
gain_db = 20*log10(gain)

phase = angle(g)
phase_deg = rad2deg(phase)

%%
clc
clear all
z = tf('z')
g = 0.0043361*(z+0.861)/(()

%%
% already known frequency response, solve the frequency
clc
clear all

e = exp(1)
syms a b w k
eq = k^2 == (a*b-w^2)^2 + (a+b)^2*w^2
a = 1
b = 2
k = 20
S = eval(solve(eq,w))

%%
% Dl + k Nl = 0
clc
clear all

e = exp(1)
T = 0.1
z = tf('z', T)
s = tf('s')
g = 20/((s-1)*(s-2))


t = 1/(J*wn)
syms J wd wn t

J = sqrt(1/(((wd/(1/t))^2)+1))
wd = (1/T) * acos((-B*e^((1/t)*T)*0.5))
B = -2*cos(wd*T)*e^(-(1/t)*T) == 0.5
%%
% PID
clc
clear all
s = tf('s')
K = 100
Ti = 1
Td = 0.05

P = K
I = 1/(Ti * s)
D = Td * s
G = P * (I + D + 1)
fix = 1/(Td * s + 1)
G_new = G * fix
bode(G, G_new)


%%
% pole and zero matching
clc
clear all

T = 0.1
e = exp(1)
z = tf('z', T)
g = 0.0043361*(z+0.861)/(z-0.6065)
f = 12.84*(z-0.6065)
l = 0.0043361*12.84*(z+0.861)/(z-0.6065) 



p = pole(g)
z = zero(g)
z1 = e^(p(1)*T)
z2 = e^(p(2)*T)
%%
% rank of matrix(obverserility and controballity)
clc
clear all
A = [1 2; 3 4]
B = [-1 1]'
C = [-1 1]
gamma_control = [B A*B]
r_control = rank(gamma_control)
gamma_observe = [C;C*A]
r_observe = rank(gamma_observe)
%%
% gain vector
clc
clear all

s = tf('s')
A= [-9.375 -18.39; 1 0]; B=[1;0]; C=[0 0.9375]; D=0;
sys=ss (A,B,C,D)
h = 1/(s^2+19.94*s+324)
P = pole(h)
K = place(A,B,P)
eig(A-B*K)

Acl = (s-P[0])*(s-P[1])
acl = A*A+19.94*A+324*eye(2)
gamma_control = [B A*B]
inv_gamma_control = inv(gamma_control)
k = [0,1] * inv_gamma_control * acl
