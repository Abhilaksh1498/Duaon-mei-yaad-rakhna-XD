s = poly(0,'s');
t = 0:.001:10;

// PART a
G = 9/(s^2+2*s+9);
G = syslin('c',G);
[zeros_,poles,k]=tf2zp(G);          // transfer function to zeros poles

G1= (9/2)*(s+2)/(s^2+2*s+9);       // function is normalised st dc gain = 1 (same as original)
G1 = syslin('c',G1);

y = csim('step',t, G);  // original step response
y1 = csim('step',t, G1);  // step response with an added zero
o = [y;y1];

steady_state_value = 1;
param = zeros(2,4);

for i = 1:2
    param(i,1) = 100*(max(o(i,:)) - steady_state_value);              // % overshoot
    t1 = t(find(o(i,:)>.9))(1);                 // find function returns array of indices of elements satisfying the criterion
    t2 = t(find(o(i,:)>.1))(1);                 // we want the first instance
    param(i,2) = t1-t2;                         // rise time
    param(i,3) = t(find(o(i,:) == max(o(i,:))));           // peak time
    param(i,4) =  t(find(o(i,:)>.98 & o(i,:) < 1.02))(1);         // settle time
end

disp(param(1,:));
disp(param(2,:));
plot2d(t, o');
xgrid(5,1,3);
legend(['Original TF', 'TF with an added zero']);
xlabel('Time t (in sec)');
ylabel('Step Response');
title('Comparison of Step Responses of original & added zero systems');
show_window(1)

// PART b
// pole closer to origin than existing ones
G_b1 = (.75*9)/((s^2+2*s+9)*(s+.75));
G_b1 = syslin('c',G_b1);

// pole farther to origin than exisiting ones
G_b2 = (4*9)/((s^2+2*s+9)*(s+4));
G_b2 = syslin('c',G_b2);

y_b1 = csim('step',t,G_b1);
y_b2 = csim('step',t,G_b2);
o = [y_b1;y_b2];

param_b = zeros(2,4);
for i = 1:2
    param_b(i,1) = 100*(max(o(i,:)) - steady_state_value);              // % overshoot
    t1 = t(find(o(i,:)>.9))(1);                 // find function returns array of indices of elements satisfying the criterion
    t2 = t(find(o(i,:)>.1))(1);                 // we want the first instance
    param_b(i,2) = t1-t2;                         // rise time
    param_b(i,3) = t(find(o(i,:) == max(o(i,:))));           // peak time
    param_b(i,4) =  t(find(o(i,:)>.98 & o(i,:) < 1.02))(1);         // settle time
end

disp(param_b(1,:));
disp(param_b(2,:));
plot2d(t, cat(2,o',y'));               // cat function concatenates vectors, 2 => along col
xgrid(5,1,3);
legend(['TF with pole closer to origin', 'TF with a pole farther to origin', 'original TF']);
xlabel('Time t (in sec)');
ylabel('Step Response');
title('Comparison of Step Responses of added poles, closer and farther to origin');
show_window(2)
