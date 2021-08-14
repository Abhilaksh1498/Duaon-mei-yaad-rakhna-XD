

s = poly(0,'s');

// part a
G = 1/((s+1)*(s^2+1)*(s^2+4));
scf(0);
evans(G, kpure(G));


//part b
// shifting origin by 2
G1 = 1/((s+3)*((s+2)^2+1)*((s+2)^2+4));
G1= syslin('c',G1);
scf(1);
bode(G1, 0.01, 100);

// part c
G2= ((s+8)^4)/((s+3)*((s+2)^2+1)*((s+2)^2+4));
scf(2);
bode(syslin('c',G2), .01, 1000)

// part d
G3 =  ((s+8)^4)/((s+3)*((s+2)^2+1)*((s+2)^2+4));
scf(3);
evans(G3, 50);


