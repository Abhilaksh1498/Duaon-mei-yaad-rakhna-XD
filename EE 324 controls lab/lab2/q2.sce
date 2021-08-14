s = poly(0,'s');

dr = 1/5; // damping ratio
w = 1; // frequency of oscillation

G = w^2 /( s ^2 + 2* dr * w * s + w ^2) ;
G = syslin('c',G);

t = 0:.01:50;
plot2d(t,csim('step',t,G));
xlabel (" time (in secs )") ;
ylabel (" system response ") ;
title (" Step Response ");
show_window(1);

dr_range = 0:.25:2.1;    // There are 9 values of dr to check (inclusive of 2)
//settle_time = zeros(1,9);
//rise_time = zeros(1,9);
//os = zeros(1,9);              // percentage overshoot
// peak_time = zeros(1,9);
outputs_matrix = zeros(size(t)(2),9);   //size returns a tuple rxc
for i = 1:9;
    zeta = dr_range(i);
    G = w^2 /( s ^2 + 2* zeta * w * s + w ^2) ;
    G = syslin('c',G);
    outputs_matrix(:,i) = csim('step',t,G);
end

plot2d(t,outputs_matrix);
legend(['0','.25','.5','.75','1','1.25','1.5','1.75','2']);
xlabel (" time (in secs )") ;
ylabel (" system response ") ;
title (" Step Responses for varying damping ratios");
show_window(2);
