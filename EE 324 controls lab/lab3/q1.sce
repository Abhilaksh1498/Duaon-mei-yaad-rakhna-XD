s = poly(0,'s');

// PART a
a_range = -1:.01:1.001;
t = 0:.005:5;
outputs = zeros(length(t), size(a_range)(2));       // length returns length for either col or row vector (more convenient than size fucntion)
for i = 1:size(a_range)(2)
    a = a_range(i);
    G = (s+5+a)/(s^2+11*s+30);
    G = syslin('c',G);
    outputs(:,i) = csim('step', t,G);
end

// when plotting multiple y on same plot, individual y must be a col vector
plot2d(t,outputs);
xlabel('Time t (in sec)');
ylabel('Step Response');
title('Step Response with Slight variation in zeros');
show_window(1);

// Explicitly plotting for pole-zero cancellation
G1 = 1/(s+6);
G1 = syslin('c',G1);
plot2d(t, csim('step', t,G1));
xlabel('Time t (in sec)');
ylabel('Step Response');
title('Step response with pole-zero cancelled system i.e. a = 0');
show_window(2);

// PART b
G = 1/(s^2-s-6);
G = syslin('c',G);
y1 = csim('step', t,G);

G_new = (s-3)/(s^2-s-6);
G_new = syslin('c',G_new);
y2 = csim('step', t,G_new);
plot2d(t,[y1',y2']);
xgrid(5, 1, 7);                        // color, thickness, style
a = gca();
a.data_bounds = [0,0;5,1];
legend(['With Right Half Pole', 'Without Right half Pole'])
xlabel('Time t (in sec)');
ylabel('Step Response');
title('Step responses with and without right half pole');
show_window(3);

t = 0:.005:10;
a_range = -.002:.0002:.002;
outputs = zeros(length(t), length(a_range));
for i = 1:length(a_range)
    a = a_range(i);
    G = (s-3+a)/(s^2-s-6);
    G = syslin('c',G);
    outputs(:,i) = csim('step', t,G);
end
plot2d(t,outputs);
a = gca();
a.data_bounds = [0,0;10,1];
xgrid(2);
xlabel('Time t (in sec)');
ylabel('Step Response');
title('Step Responses with zeros very close to RHP pole');
show_window(4);
