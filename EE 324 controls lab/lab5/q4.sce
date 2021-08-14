s = poly (0, 's');

sys = 0.11*( s + 0.6) /(6* s^2 + 3.6127* s + 0.0572) ;
t = 0.1:0.1:1000;
plot (t, csim ('step ', t, syslin ('c',sys )));
xlabel (" Time (s)");
ylabel (" Magnitude ");
title (" Step Response ");

k_range = 0.1:0.1:100;
for i = 1:length(k_range)
    e = 100/(1+k_range(i)*.066/.0572);
    disp("K value: " + string(k_range(i))+ " Steady state error percent: " +string(e))
end
figure (2)
evans (sys ,100)
