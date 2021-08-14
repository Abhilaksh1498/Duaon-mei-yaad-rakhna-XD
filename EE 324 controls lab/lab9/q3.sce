
s = poly(0,'s');
G = 100/(s+30);
T = .028;
pade= (1-s*T/2)/(1+s*T/2);

G_delayed = syslin('c', G*pade);
G = syslin('c', G);

scf(0);
bode(G)

scf(1);
bode(G_delayed)
