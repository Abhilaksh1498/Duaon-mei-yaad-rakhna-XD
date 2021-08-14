s = poly(0,'s');
t = 0:.001:10;

// PART A
h1 = 1/s^2;
h2 = 50*s/(s^2+s+100);
h3 = s-2;
h4 = h1*h2*h3;

Heq = syslin('c', h4/(1+h4));

// PART B         
h1 = s; 
h2 = 1/s;

h3 = h1*h1+h2;          // inner series + parallel connection
h4 = h3/(h3+1)*h2;       // taking care of upper feedback loop

Heq_b = syslin('c', h1*h4/(1+h1*h4));            // very similar to a part (just there is additional multiplication in feedback loop),         this Heq itslf works like a syslin object would

//PART C
h1 = s;
h2 = 2*s;
h3 = 1/(s+1);
h4 = 4;

G1 = h1+h2;
G2 = h1/(1+h1);
G3 = h1/(G1);          // 1/s+2
G4 = G1*G2+ h2;
G5 = 4*G3/(1+4*G3);
G6 = G4*G5;

Heq = syslin('c', G6/(1+G6));
