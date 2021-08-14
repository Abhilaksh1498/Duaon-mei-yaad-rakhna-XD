s = poly(0,'s');
G = 1/s;
G = syslin('c',G);

t = 0:.01:5
plot2d(t, csim('step',t,G));
xlabel('time');
ylabel('system output');
title('Response to unit step function');
show_window(1);

z = poly(0,'z');
D = 1/z;  // naming it D since it is discrete
D = syslin('d',D);
D = tf2ss(D);

t_d = 0:1:15;
u = ones(t_d);
y_d = dsimul(D,u);
scatter(t_d,y_d);
a = gca();
a.data_bounds= [-.5,0;16,2];
xlabel('Time Steps [n]');
ylabel('y[n]');
title('Step response for discrete system D(z) = 1/z');
show_window(2);

p = poly(0,'p');
G1 = 1/p;
plot2d(t, csim('step',t,G1));
xlabel('time');
ylabel('system output');
title('Response to unit step function with polynomial given to csim');
show_window(2);

