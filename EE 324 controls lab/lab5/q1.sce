s = poly(0,'s');
 // Part-A

// G/G+1 = given value
G = 10/(s*(s^2+4*s+5));
G = syslin('c',G);
evans(G,100);
show_window(1)

// Part-B
G = syslin('c', (s+1)/(s^2*(s+3.6)));
evans(G,100);
show_window(2)

// Part-C
G = syslin('c', (s+.4)/(s^2*(s+3.6)));
evans(G,100);
show_window(3)

// Part-D
ps = [-5,-2,-1.5,-1,0,1,1.5,2,3,4,5]
for i = 1:length(ps)
    p = ps(i) 
    G = syslin('c', (s+p)/(s*(s+1)*(s+2)));
    scf(i+3);
    evans(G,100);
    xs2png(i+3, 'Q1d'+  string(10*p)+ '.png');
end
evans(G,100);
show_window(4)
