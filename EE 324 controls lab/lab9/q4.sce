
s = poly(0,'s');
G = 1/(s^3+3*s^2+2*s);
G = syslin('c',G);

// rlocus
scf(0);
evans(G,25);

kpure(G)

// Nyquist
scf(1);
nyquist(G,.05,40);   //~.16

// Bode actual
scf(2);
bode(G)
[gm,fr] = g_margin(G)       // gm = 15.5dB


// bode asymptodic
scf(3);
bode(G,'rad');
bode_asymp(G)

