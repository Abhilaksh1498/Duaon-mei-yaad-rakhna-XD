
s = poly(0,'s');

G = 1/(s^2+3*s+2);

// part a
scf(0);
os = .1;
k = 4.397;
G1 = k*G/(1+k*G);
poles = roots(G1('den'));

t_s = mean(-4./(real));              // original closed loop ts
t_s = t_s/2;
x = -4/t_s;

m = 1/(-1*log(os)/(%pi));
x = -8:.01:0;
os_line_1 = m.*x;
os_line_2 = -1*m.*x;
plot(x,os_line_1,'r');
plot(x,os_line_2,'r');  
