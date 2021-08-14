
s = poly(0,'s')
H = 1/(s^2+3*s+2)
G1 = syslin('c',H)

// part b 
os = 0.1
const = (log(1/os)/%pi)^2
dr = sqrt(const/(1+const))
k_arr = 0:0.001:100
for k=k_arr
    p = (s^2+3*s+2)+k
    rt = roots(p)
    img = abs(imag(rt(2)))
    rea = abs(real(rt(2)))
    co = rea/(sqrt(rea^2 + img^2))
    if co<=dr
        break
    end
end
k_10_os = k
img = 2*img
height = img
sin1 = img/sqrt(img^2 + 2^2)
cos1 = sqrt(1-sin1^2)
sin2 = img/sqrt(img^2 + 1^2)
cos2 = sqrt(1-sin2^2)
m = (sin1*cos2 + cos1*sin2)^2
d = sqrt(img^2 * (1-m)/m)
z = 3+d
disp("Angle (in deg) made by the extra zero with real axis is",atan(img/d)*180/%pi)
H_pd = H*(s+z)
G_pd = syslin('c',H_pd)

figure;
clf();
evans(G_pd)
plot([-3,-3],[-30,30],'r')
plot([-100,100],[4.0934,4.0934],'r')
for k=k_arr
    p = (s^2+3*s+2)+k*(s+z)
    rt = roots(p)
    img = abs(imag(rt(2)))
    rea = abs(real(rt(2)))
    if rea>=3
        break
    end
end
disp("The PD controller for 10% overshoot and half settling time has Kd ",k)

// part a 
dz = height/tan(%pi/3)
dp = height/tan((%pi/3) - atan(height/d))
H_lead = H*(s+3+dz)/(s+3+dp)
G_lead = syslin('c',H_lead)

figure
clf()
evans(G_lead)
plot([-3,-3],[-30,30],'r')
plot([-100,100],[4.0934,4.0934],'r')
for k=k_arr
    p = (s+3+dp)*(s^2+3*s+2)+k*(s+3+dz)
    rt = roots(p)
    img = abs(imag(rt(2)))
    rea = abs(real(rt(2)))
    if rea>=3
        break
    end
end
disp("The lead compensator for 10% overshoot and half settling time has gain k ",k)

