s = poly(0,'s');

G1 = (s+5)/((s+4)*(s+2));
G1 = syslin('c',G1);

G2 = (s+5)/(s+4);
G2 = syslin('c',G2);

G3 = 1/(s+2);
G3 = syslin('c',G3);

tau = [0.1 , 0.5 , 2];

for i = 1:3
    t = 0:tau(i):10;
    y1 = csim('step', t, G1);
    y2 = csim(csim('step', t, G2),t,G3);
    y3 = csim(csim('step', t, G3),t,G2);   // to create cascade you feed prev o/p into i/p of csim command
    plot2d(t, [y1',y2',y3'])
    legend(['First';'Second';'Third']);
    xlabel (" Time (in secs )") ;
    ylabel (" Step Response ") ;
    title (" Comparing step response for tau = " + string (tau(i))) ;
    show_window(i);
end
