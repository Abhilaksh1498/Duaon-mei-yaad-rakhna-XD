clear;
s = %s;
A = [1, 0, 0; 0, 4, 0; 0, 0, 6];
B = [1; 5; 8]; // [1;0;8]
C = [1, 0, 7]; // [1,2,7]
T = [1, 2, 1; 2, 1, 2; 3, 4, 5];
I = eye(3, 3);
D = 5;
G = D + C * inv(s*I - A) * B;
printf("G(s) :\n");
disp(G);
eig_values = spec(A);
printf("Eigenvalues of A : \n");
disp(eig_values);
poles = roots(G.den);
printf("Poles of A : \n");
disp(poles);
