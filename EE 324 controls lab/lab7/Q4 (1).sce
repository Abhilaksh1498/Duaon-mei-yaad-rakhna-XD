//Question 4
clc 
clear

s = poly(0,'s')
H = 1/(s^2+5*s+6)
G = syslin('c',H)
figure;
clf();
evans(G);

// Question 4a*************************
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
bode(G,0.01,100)
figure
clf()
xgrid()
plot ('ln', w_arr/(2*%pi) ,20*log10(mg) )
ylabel ("magnitude response (in dB)")
xlabel ('frequency (in Hz)')
figure 
clf()
xgrid()
plot ('ln', w_arr/(2*%pi) , -1*phase )
ylabel ('phase response')
xlabel ('frequency')

// Question 4c *************************************************
s = poly(0,'s')
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
xgrid()
plot ('ln',w_arr/(2*%pi), 20*log10(mg))
ylabel ("magnitude response (in dB)")
xlabel ('frequency (Hz)')
figure 
clf()
xgrid()
plot ('ln',w_arr/(2*%pi), -1*phase)
ylabel ('phase response')
xlabel ('frequency')

figure 
clf()
bode(G,0.01,100)

w = poly (0,'w')
G_w = horner (G , %i *w);
w1 = roots (imag(G_w('den')));
w1 = w1(w1>0) ;
disp ('frequency when the phase angle difference is 180 degrees is' + string ( w1 ))



