s = poly(0,'s');
G = 35/(s+1);  // a = 35, b = 1 (Abhilaksh, 18D070035)
G = syslin('c',G);   // convert rational poly to cont. system

// Part 1(b)
t = 0:.01:10;
y_b = csim('step', t, G);  // output to step response

tau = 1;  // 1/b
settling_time = -1*tau*log(.02);
rise_time = tau*(log(.9/.1));   // overall rise time, time diff btw 90% & 10%
plot2d(t, y_b)
xlabel('time');
ylabel('system response');
title('unit step response of G');
show_window(1)

// Part 1(c)
a = 35;
range_a = a:a:100*a;
range_rise = linspace(rise_time,rise_time,100);
plot2d(range_a,range_rise);
xlabel ("a") ;
ylabel (" Rise Time (in secs )") ;
title (" Variation of Rise Time with a") ;
show_window(2)

// Part 1(d)
b = 1;
range_b = b:b:100*b;
range_rise_b = log(.9/.1)./range_b;
plot2d(range_b,range_rise_b);
xlabel ("b") ;
ylabel (" Rise Time (in secs )") ;
title (" Variation of Rise Time with b") ;

