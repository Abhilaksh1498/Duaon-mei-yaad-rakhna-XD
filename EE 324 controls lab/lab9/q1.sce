
s = poly(0,'s');

G = syslin('c', 10/(s*(s/5+1)*(s/20+1)));

G1 = syslin('c', (s+3)/(s+1)*(10/(s*(s/5+1)*(s/20+1))));         // with lag compensator

G2 = syslin('c', (s+1)/(s+3)*(10/(s*(s/5+1)*(s/20+1))));       // with lead compensator

nyquist(G)
nyquist(G1)
nyquist(G2)

nyquist([G;G1;G2],["Original Plant";"Plant with lag compensator"; "Plant with lead compensator"])

[gm ,w_gcf]=g_margin(G);
[gm1 ,w_gcf1]=g_margin(G1);
[gm2 ,w_gcf2]=g_margin(G2);


[pm ,w_pcf]=p_margin(G);
[pm1 ,w_pcf1]=p_margin(G1);
[pm2 ,w_pcf2]=p_margin(G2);
