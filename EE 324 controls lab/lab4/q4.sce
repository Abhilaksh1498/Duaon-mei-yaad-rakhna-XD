s = poly(0,'s');

// PART a
G1 = (s^2+5*s+3)*(s^4+s^2+1);
[routh_table_1 ,B] = routh_t(G1);
disp(routh_table_1)

// PART b
G2 = (s^4+2*s^3+s^2+6*s+3)*(s^4+s^2+1);
[routh_table_2 ,B] = routh_t(G2);
disp(routh_table_2)

// PART c
G3 = s^6+ s^4;
[routh_table_3 ,B] = routh_t(G3);
disp(routh_table_3)
