s = poly(0,'s');

G = 1/(s^2+3*s+2);

// part a
scf(0);
os = .1;
m = 1/(-1*log(os)/(%pi));
x = -8:.01:0;
os_line_1 = m.*x;
os_line_2 = -1*m.*x;
plot(x,os_line_1,'r');
plot(x,os_line_2,'r');                   
evans(G, 90);                          // k =4.397

// part b
k = 4.397;
sse_original = 1/(1+k/2);               // .313
sse_with_lag_compensator = 1/(1+20*k/2);                    // .0222

// part c
zero_ = [.001, .01, .1, .2,.5];
i =1;
t = 0:.01:75
for z = zero_
    scf(i);
    p = z/20;
    G_open = G*(s+z)/(s+p)*k;
    G1 = G_open/(1+G_open);
    G1  = syslin('c', G1);
    plot2d(t, csim('step', t, G1));
    xs2png(i, 'q2_c_'+string(1000*z));
    i = i+1;
end
                               
