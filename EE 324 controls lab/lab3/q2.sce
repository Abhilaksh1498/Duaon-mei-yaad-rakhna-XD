s = poly(0,'s');

// PART a
t = 0:.005:8;
G = 85/(s^3+7*s^2+27*s+85);
G = syslin('c',G);
y1 = csim('step', t,G);

G_approx = 17/(s^2+2*s+17);
G_approx = syslin('c',G_approx);
y2 = csim('step', t,G_approx);
plot2d(t,[y1',y2']);
xgrid(5,1,3);
legend(['Original TF', '2nd Order Approximation']);
xlabel('Time t (in sec)');
ylabel('Step Response');
title('Comparison of Step Responses of original & 2nd order approximated systems');
show_window(1);

// PART b
t = 0:.05:100;
G = (s+.01)/(s^3+2.02*s^2+5.04*s+.1);
G = syslin('c',G);
y1 = csim('step', t,G);

G_approx = .5/(s^2+2*s+5);
G_approx = syslin('c',G_approx);
y2 = csim('step', t,G_approx);
plot2d(t,[y1',y2']);
xgrid(5,1,3);
legend(['Original TF', '2nd Order Approximation']);
xlabel('Time t (in sec)');
ylabel('Step Response');
title('Comparison of Step Responses of original & 2nd order approximated systems');
show_window(2);
