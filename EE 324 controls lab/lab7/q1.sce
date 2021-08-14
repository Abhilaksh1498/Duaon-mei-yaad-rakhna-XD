s = poly(0,'s')

G = 1/((s+4)*(s+3)*(s+12));

// part a
scf(0);
G1 = (s+.01)/s*G;
evans(G1, kpure(G1))

zeta = .2
m = sqrt(1-zeta^2)/zeta;
x = -4:.01:0;
os_line_1 = m.*x;
os_line_2 = -1*m.*x;
plot(x,os_line_1,'r');
plot(x,os_line_2,'r');                   // k = 660.3

// part b
scf(1);
evans(G1, kpure(G1));
w1 = 8;
w2 = 9;
t = 0:.01:2*%pi;

x1 = w1*sin(t);
y1 = w1*cos(t);                // k = 941.3

x2 = w2*sin(t);
y2 = w2*cos(t);              // k = 1315
plot2d(x1,y1);
plot2d(x2,y2);

// part c
z_range = [.001, .01, .1,.5, 1]
i = 2;
for z = z_range
    G1 = (s+z)/s*G;
    scf(i);
    evans(G1, kpure(G1));
    xs2png(i, 'q1_c_'+string(z*1000));
    i = i+1;
end


