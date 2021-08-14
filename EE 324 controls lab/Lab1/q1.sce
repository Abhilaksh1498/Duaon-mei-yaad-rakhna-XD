s = poly(0,'s');
G1 = 10/(s^2 + 2*s+10);
G2 = 5/(s+5);

//#############################################################################################
//#############################################################################################
//                                          Q1
//a) The equivalent transfer function is the product of two
G_cascade = G1*G2

// b) The equivalent transfer function is the addition of two
G_parallel = G1 + G2

// c) The equivalent transfer function is G1/(1+G1*G2) 
G_feedback = G1/(1+G1*G2)

// d) To find the output to step response we need to explicitly define G1 as a continuous time system using syslin command
G1 = syslin('c',G1);
t = 0:.01:10;         // for an total length of 10 units evaluated at intervals of .01
plot2d(t,csim('step',t,G1))    // csim returns a vector containing output on all values of t provided, with G1 as transfer function
xlabel('time')
ylabel('output')
title('unit step response with G1 as transfer function')


//#############################################################################################
//#############################################################################################
//                                          Q2
// tf2zp (transfer function to zero pole) function can be directly used
// The argument to this function also requires that we have an object of type syslin
G_parallel = syslin('c',G_parallel);
G_cascade = syslin('c',G_cascade);
G_feedback = syslin('c',G_feedback);

// Poles and Zeroes of 
// 1. Cascade
[z_cascade, p_cascade, k] = tf2zp(G_cascade);

// 2. parallel
[z_parallel, p_parallel, k] = tf2zp(G_parallel);

// 1. Feedback
[z_feedback, p_feedback, k] = tf2zp(G_feedback);


//#############################################################################################
//#############################################################################################
//                                          Q3
Z = [-1-s,-2, (s^2+7*s+7)/(s+1); (2*s^2+ 4*s+3)/(s+1), -1/(s+1), -1-s; -1/(s+1), (s^2+4*s+4)/(s+1), -2];

Y = inv(Z);  // calculates inverse of Z
tf_vector = Y * [1;0;0]

// The final answers are
I1_V1 = tf_vector(1,1);
I2_V1 = tf_vector(2,1);
I3_V1 = tf_vector(3,1);
