s = poly(0,'s');
k1_range = [.001, .01, .1, 1];
t = 0:.1:75;
steps = zeros(length(t), length(k1_range));
impulses = zeros(length(t), length(k1_range));

for i = 1:length(k1_range)
    k1 = k1_range(i)
    k2 = k1/5;
    G = (s+k1)/(s+k2);
    G = syslin('c',G);
    steps(:, i) = csim('step', t, G);
    impulses(:, i) = csim('impulse', t, G);  
end

scf(0);
plot2d(t, steps)
title('step responses')
legend(['k1 = .001', 'k1= .01', 'k1 = .1', 'k1 = 1'])

scf(1);
plot2d(t, impulses)
title('Impulse responses')
legend(['k1 = .001', 'k1= .01', 'k1 = .1', 'k1 = 1'])

