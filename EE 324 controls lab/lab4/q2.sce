s = poly(0,'s');
G = 10/(s*(s+2)*(s+4));

// PART A
k = 4;                         // any arbitrary value chosen
H = k*G/(1+k*G);
disp(H);

// PART B
k_range = .1:.1:100.1;                             // excluding k =0 case
// for each k we get 3 poles since denominator of H is cubic
poles = zeros(3,length(k_range));

for i = 1:length(k_range)
    k = k_range(i);
    H = syslin('c',k*G/(1+k*G));
    [_,p, _] = tf2zp(H)
    poles(:,i)  = p;
end

plot2d(real(poles'), imag(poles'), [-2,-3,-4]);
a = gca()
a.data_bounds = [-12,-9;4,9];
title('Loci of closed loop poles as K varies')
xlabel('Real (poles)');
ylabel('Imaginary (poles)');

// PART C
k1 = k_range(find(real(poles(2,:))>= 0))(1);
k2 = k_range(find(real(poles(3,:))>= 0))(1);
k3 = k_range(find(real(poles(1,:))>= 0))(1);
k_critical = min(k1,k2,k3);
