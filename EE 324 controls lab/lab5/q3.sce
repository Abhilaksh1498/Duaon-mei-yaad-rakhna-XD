s = poly(0,'s');
k_range = .1:.1:15;
t = 0:.015:60; 
rise_times = zeros(1,length(k_range));

for i = 1:length(k_range)
    k = k_range(i);
    G = k/(s^3+3*s^2+5*s+k);
    G = syslin('c', G);
    o = csim('step',t,G);
    t1 = t(find(o>.9))(1);
    t2 = t(find(o>.1))(1);
    rise_times(1,i) = t1-t2;
end

tr_min = min(rise_times(1,2:length(k_range)))
k_min = k_range(find(rise_times == tr_min));

