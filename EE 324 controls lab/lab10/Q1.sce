clear;
s = %s;
A = [1, 2, 3; 4, 5, 6; 7, 8, 8];
B = [2; 5; 10];
C = [1, 4, 7];
T = [1, 2, 1; 2, 1, 2; 3, 4, 5];
I = eye(3, 3);
D = 5;
G = D + C * inv(s*I - A) * B;
printf("G(s) before the transformation :\n");
disp(G);
eig_values = spec(A);
printf("Eigenvalues of A : \n");
disp(eig_values);
poles = roots(G.den);
printf("Poles of A : \n");
disp(poles);
A = inv(T) * A * T;
B = inv(T) * B;
C = C * T;
G = D + C * inv(s*I - A) * B;
printf("G(s) after the transformation : \n");
disp(G);

printf("Proper function\n")
G = (s^2 + 3*s + 2)/(s^2 + 9*s + 20);
[A, B, C, D] = abcd(G);
printf("A"); disp(A); printf("B"); disp(B); printf("C"); disp(C); printf("D"); disp(D);

printf("Strictly Proper function\n");
G = (s + 1)/(s^2 + 9*s + 20);
[A, B, C, D] = abcd(G);
printf("A"); disp(A); printf("B"); disp(B); printf("C"); disp(C); printf("D"); disp(D);
