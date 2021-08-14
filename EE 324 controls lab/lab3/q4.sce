s = poly(0,'s');
t = 0:.001:30;

// PART a
G1 = 1/(s^2+1);                // undamped
G2 = 1/(s^2+.4*s+1);        // underdamped (zeta = 1/5)
G3 = 1/(s^2+3*s+1);       // overdamped  (zeta = 1.5)

G1 = syslin('c',G1);
G2 = syslin('c',G2);
G3 = syslin('c',G3);

y1 = csim('step',t,G1);
y2 = csim('step',t,G2);
y3 = csim('step',t,G3);

plot2d(t,[y1',y2',y3']);
legend(['Undamped (zeta =0)','Underdamped (zeta =1/5)','overdamped (zeta =1.5)']);
xlabel('Time t (in sec)');
ylabel('Step Response');
title('Step Responses of Un, Under, Over - damped systems');
show_window(1)

param = zeros(2,5);                      // for over & underdamped only
o = [y2;y3;y1];
steady_state_value = 1               // both over & underdamped have steady state value of 1
for i = 1:2
    param(i,1) = 100*(max(o(i,:)) - steady_state_value);              // % overshoot
    t1 = t(find(o(i,:)>.9))(1);                 // find function returns array of indices of elements satisfying the criterion
    t2 = t(find(o(i,:)>.1))(1);                 // we want the first instance
    param(i,2) = t1-t2;                         // rise time
    param(i,3) = t(find(o(i,:) == max(o(i,:))));           // peak time
    param(i,4) = t(find(o(i,:)>.98 & o(i,:) < 1.02))(1);         // settle time
    param(i,5) = t(find(o(i,:) >= .5))(1)                            // delay time (time to reach 50% in first oscillation)
end

// PART b
// the damping ratio is still kept as 1/5
t = 0:.001:15;
o = zeros(5, length(t));
f_range = [1 3 5 7 9];                 // note that steady state value is independent of f and is = 1
param_b = zeros(5,5);
for i = 1:5
    f = f_range(i);
    G = f^2/(s^2+f^2+.4*f*s);
    G = syslin('c',G);
    o(i,:) = csim('step',t,G);
    param_b(i,1) = 100*(max(o(i,:)) - steady_state_value);              // % overshoot
    t1 = t(find(o(i,:)>.9))(1);                 // find function returns array of indices of elements satisfying the criterion
    t2 = t(find(o(i,:)>.1))(1);                 // we want the first instance
    param_b(i,2) = t1-t2;                         // rise time
    param_b(i,3) = t(find(o(i,:) == max(o(i,:))));           // peak time
    param_b(i,4) = t(find(o(i,:)>.98 & o(i,:) < 1.02))(1);         // settle time
    param_b(i,5) = t(find(o(i,:) >= .5))(1);
end

plot2d(t,o');
legend(['f = 1','f = 3', 'f = 5', 'f = 7', 'f = 9']);
xlabel('Time t (in sec)');
ylabel('Step Response');
title('Step Responses of Underdamped systems with varying frequencies');
show_window(2)


plot2d(f_range,param_b(:,[2 3 4 5]));
legend(['Rise time', 'Peak Time', 'Settle Time', 'Delay Time']);
xlabel('Freq');
ylabel('Various parameter values');
title('Variation of various parameters with damping frequency');
show_window(3)

