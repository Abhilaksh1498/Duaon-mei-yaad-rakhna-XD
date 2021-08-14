s = poly(0,'s');
G = 1/(s*(s^2+4*s+8));
G = syslin('c',64*G+1);
scf(0)
bode(G, 0.01, 100);

// bode plot of original tf
scf(1)
G1 = 1/(s*(s^2+4*s+8));
G1 = syslin('c',G1);
bode(G1,.01,150)
