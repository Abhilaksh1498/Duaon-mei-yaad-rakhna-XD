s = poly (0 , 's') ;

G1 = 2/( s +2) ;
G1 = syslin ('c', G1 ) ;

G2 = 1/( s ^2 + 10* s + 1) ;
G2 = syslin ('c', G2 ) ;

t = 0:0.003:45;


y1 = csim ('step', t , G1 ) ;
y2 = csim ('step', t , G2 ) ;

plot2d (t , [y1',y2']) ;
legend([ 'first order'; 'second order'] ) ;
xlabel ('Time (in secs )') ;
ylabel ('Step Response') ;
title ('Step response') ;
show_window(1)

// Third case (repeated zeros, 2nd order)
G3 = 4/( s +2) ^2;
G3 = syslin ('c', G3 ) ;
y3 = csim('step', t , G3 ) ;

plot2d (t ,y3) ;
xlabel (" Time (in secs )") ;
ylabel (" System response ") ;
title (" Step Response for hird case (repeated zeros, 2nd order) Case ") ;
show_window(2)
