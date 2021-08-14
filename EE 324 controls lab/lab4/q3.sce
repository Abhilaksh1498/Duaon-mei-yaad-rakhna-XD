s = poly(0,'s');

// PART a
G1 = s^5+3*s^4+5*s^3+4*s^2+s+3;
[routh_table_1 ,B] = routh_t(G1);

// PART b
G2 = s^5+6*s^3+5*s^2+8*s+20;
[routh_table_2 ,B] = routh_t(G2);

// PART c
G3 = s^5-2*s^4+3*s^3-6*s^2+2*s-4;
[routh_table_3 ,B] = routh_t(G3);

// PART d
G4 = s^6+s^5-6*s^4+s^2+s-6;
[routh_table_4 ,B] = routh_t(G4);
