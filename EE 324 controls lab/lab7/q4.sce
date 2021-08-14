s = poly(0,'s');
G = 1/(s^2+5*s+6);
G = syslin('c',G);

// part a
w_range = [.1, 1, 5, 10, 50];
output_amp = zeros(1,5);
phase_a = zeros(1,5);
i = 1;

for w = w_range
    scf(i-1);
    t = 0:%pi/(100*w):4*(%pi)/w;
    x = sin(w*t);
    y = csim(x,t,G);    
    output_amp(i) = max(y);
    t1 = t(y == max(y))(1);
    t2 = t(x == max(x))(1);
    phase_a(i) = 180*w*(t1-t2)/(%pi);
    plot(t,x, 'b');
    plot(t,y, 'r');
    title('I/p & o/p signal for freq = '+string(w)+'rad/s');
    legend('input','output')
    xs2png(i-1, 'q4_a'+ string(10*w));
    i = i+1;  
end

scf(5)
bode(G, 0.01, 100);


// part b
//G = 60/(s^3+6*s^11*s+6);
//G = syslin('c',G);
//w_range = [.1, 1, 5, 10, 50];
//output_amp_b = zeros(1,5);
//phase_b = zeros(1,5);
//i =1
//for w = w_range
//    t = 0:%pi/(50*w):4*(%pi)/w;
//    x = sin(w*t);
//    y = csim(x,t,G);    
//    output_amp_b(i) = max(y);
//    t1 = t(y == max(y))(1);
//    t2 = t(x == max(x))(1);
//    phase_b(i) = 180*w*(t1-t2)/(%pi);
//    figure
//    plot2d(t,[x',y']);
//    title('I/p & o/p signal for freq = '+string(w)+'rad/s');
//    legend('input','output')
//    clf()  
//    i = i+1;
//end
//
//scf(6)
//bode(G, 0.01, 100);

H = 60/(s^3+6*s^2+11*s+6) 
G = syslin('c',H)
figure;
clf();
evans(G);

w_arr = [0.5 1 1.5 2 5]
mg = []
phase =[]
for w = w_arr
    t = 0: %pi /(50* w) :8* %pi / w;
    ip = sin(w*t)
    op = csim(ip,t,G)
    mg = [mg;max(op)]
    to = t(op == max (op))(1)
    ti = t(ip == max (ip))(1)
    phase = [phase;(to-ti)*w*180/%pi]
    figure
    clf()
    xgrid()
    plot (t ,ip ,'b')
    plot (t ,op ,'r')
    title ('Input and Output signal of frequency ' + string (w) + ' rads / sec ')
    xlabel ('time')
    legend ("input","output")
end
figure
clf()
bode(G, 0.01, 100);

w = poly (0,'w')
G_w = horner (G , %i *w);
w1 = roots (imag(G_w('den')));
w1 = w1(w1>0) ;
disp ('frequency when the phase angle difference is 180 degrees is' + string ( w1 ))

w = poly (0,'w')
G_w = horner (G , %i *w);
w1 = roots (imag(G_w('den')));
w1 = w1(w1>0) ;
disp ('frequency when the phase angle difference is 180 degrees is' + string ( w1 ))
