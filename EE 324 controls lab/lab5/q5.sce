s = poly(0, 's');
tf = 100/((s^2 + 2*s + 2)*(s+50));
scf(0)
evans(tf);
xs2png(0, 'Q5a.png')

tf2 = 2/((s^2 + 2*s + 2));
scf(1)
evans(tf2);
xs2png(1, 'Q5b.png')
t = 0:0.01:10;
k_range = [1,3,4,5,7];
count = 3;
for k = k_range
tf = tf*k;
tf2 = tf2*k;
y1 = csim('step', t, tf/(1+tf));
y2 = csim('step', t, tf2/(1+tf2));
figure(count)
f.background = 8;
plot(t, y1, 'r');
plot(t, y2, 'g');
xlabel("Time(s)");
ylabel("Magnitude");
title("Step Responses");
legends(['Third order','Second order'],[5,3],opt="lr");
count = count + 1;
end
