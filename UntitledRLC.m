%M-file for RLC circuit simulation
%input parameters and initial conditions
%and plot results of simulation
R1=3; X1=4;
R2=4; X2=3;
f=50; w=2*pi*f; Vac=70;
Z1=R1+X1*i;
Z2=R2-X2*i;
Zeq=(Z1*Z2)/(Z1+Z2);
Req=real(Zeq);
Xeq=imag(Zeq);
Leq=Xeq/w;
L1=X1/w;
C=1/(X2*w);
K1=1/Leq; K2=Req;
K3=1/L1; K4=R1;
K5=1/R2; K6=C;
vCo=0; iLo=0; tstop=0.1;
disp('run simulation, type "return" when ready to return')
keyboard
subplot(4,1,1)
plot(simout(:,1), simout(:,2))
title('current is(t)')
ylabel('is(t) in A')
grid
subplot(4,1,2)
plot(simout(:,1), simout(:,3))
title('current i1(t)')
ylabel('i1(t) in A')
grid
subplot(4,1,3)
plot(simout(:,1), simout(:,4))
title('current i2(t)')
ylabel('i2(t) in A')
grid
subplot(4,1,4)
plot(simout(:,1), simout(:,5))
title('Voltage u(t)')
ylabel('u(t) in V')
grid
xlabel('Time in sec')
% --------------------------------------
syms x1 x2
[x1,x2]=solve('x1==0','x2==0')
syms x1 x2
J=jacobian([x1;x2],[x1,x2]);
A=subs(J,{x1,x2},{0,0})
t=0:0.1:10;
u=0*t;
A=[-236.2 0;0 -3770];
B=[78.74;0.25];
C=[0,0]
D=[0];
sys=ss(A,B,C,D);
[y,ty,x]=lsim(sys,u,t,[0;-1]);
plot(x(:,1),x(:,2));
xlim([-1,1]);
ylim([-1,1]);