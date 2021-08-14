
s = poly(0,'s');
G = (s+1)/((s+5)*(s+10)*(s+100));
G = syslin('c',G);

bode(G, 0.01, 100);
