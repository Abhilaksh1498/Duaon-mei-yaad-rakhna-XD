
clear; clc;
s = poly(0,'s');
G = syslin('c', (s^2+50^2)/(s^2+90*s+50^2));
scf(0);
bode(G);
xs2png(0, 'Q2.png')

// Numerator
scf(1);
N = syslin('c', (s^2+50^2),1);
bode(N);
xs2png(1, 'Q2_NUM.png')

// Denominator
scf(2);
D = 1/(s^2+90*s+50^2);
bode(syslin('c', D));
xs2png(2, 'Q2_DEN.png')

// Steeper Bode Plot
scf(3);
G_s = syslin('c',(s^2+50^2)/(s^2+30*s+50^2));
bode(G_s);
xs2png(3, 'Q2_comp.png')
