s = poly(0,'s')

G = 1/((s+4)*(s+3)*(s+12));

// part a
err = .489
K = ((1-err)*3*4*12)/err;

// part b
scf(0);
G = syslin('c',G);
zeta = .35
m = sqrt(1-zeta^2)/zeta;
x = -6:.01:0;
os_line_1 = m.*x;
os_line_2 = -1*m.*x;
plot(x,os_line_1,'r');
plot(x,os_line_2,'r');
evans(G,kpure(G));

// part c
scf(1);
evans(G,kpure(G));

// part d
scf(2);
k_range = 0:.025:1;
t = 0:.05:10;
G = 1/((s+4)*(s+3)*(s+12));
for k = k_range
    G_eq = k*G/(1+k*G);
    G_eq = syslin('c',G_eq);
    plot2d(t, csim('step',t,G_eq));
end
xlabel('time');
ylabel('step output');
title('Step responses for various values of K');

// part e
scf(3);
k_range = 1:100:1000;
t = 0:.05:20;
G = 1/((s+4)*(s+3)*(s+12));
for k = k_range
    G_eq = k*G/(1+k*G);
    G_eq = syslin('c',G_eq);
    plot2d(t, csim('step',t,G_eq));
end
xlabel('time');
ylabel('step output');
title('Step responses for various values of 1< K < 1000');
