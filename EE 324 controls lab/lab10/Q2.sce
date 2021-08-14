clear;
s= %s;
G = (s+3)/((s+1)*(s+4));
printf("First function \n")
[A, B, C, D] = abcd(G);
printf("A"); disp(A); printf("B"); disp(B); printf("C"); disp(C); printf("D"); disp(D);

G = (s+1.001)/(s^2 + 5*s + 4);
printf("Second function \n")
[A, B, C, D] = abcd(G);
printf("A"); disp(A); printf("B"); disp(B); printf("C"); disp(C); printf("D"); disp(D);


