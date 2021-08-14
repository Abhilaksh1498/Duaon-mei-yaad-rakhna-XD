
s = poly(0,'s');
G = (10*s+2000)/(s^3+202*s^2+490*s+18001);

// a part
scf(0);
bode(syslin('c',G));

// c part
scf(1);
K = 91;
bode(syslin('c',G*K));

// d part
scf(2)
bode(syslin('c',G*K*(s+1)));
