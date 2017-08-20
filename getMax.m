function [ tmpt] = getMax( damp,dt,omega,acc )
s=sin(omega*sqrt(1-damp^2)*dt)
c=cos(omega*sqrt(1-damp^2)*dt)
et=exp(-damp*omega*dt)
damp1=damp/sqrt(1-damp^2)
dampo2=(2*damp^2-1)/omega^2/dt
dampo3=2*damp/omega^3/dt
a11=et*(damp1*s+c);
a12=et*s/omega/sqrt(1-damp^2);
a21=-omega/sqrt(1-damp^2)*et*s;
a22=et*(c-damp1*s);
b11=et*((dampo2+damp/omega)*s/omega/sqrt(1-damp^2)+(dampo3+1/omega^2)*c)-dampo3;
b12=-et*(dampo2*s/omega/sqrt(1-damp^2)+dampo3*c)-1/omega^2+dampo3;
b21=et*((dampo2+damp/omega)*(c-damp1*s)-(dampo3+1/omega^2)*(omega*sqrt(1-damp^2)*s+damp*omega*c))+1/omega^2/dt;
b22=-et*(dampo2*(c-damp1*s)-dampo3*(omega*sqrt(1-damp^2)*s+omega*damp*c))-1/omega^2/dt;
A=[a11 a12
    a21 a22]
B=[b11 b12
    b21 b22]

lengthacc=length(acc);
vol=linspace(0,0,lengthacc)';
displacement=linspace(0,0,lengthacc)';
acc2=linspace(0,0,lengthacc)';

for i=1:lengthacc-1
    acc2(i)=-(2*damp*omega*vol(i)+omega^2*displacement(i));
    temp=onestep(acc(i),acc(i+1),vol(i),displacement(i),A,B);
    displacement(i+1)=temp(1,1);
    vol(i+1)=temp(2,1);
    acc2(i+1)=-(2*damp*omega*vol(i+1)+omega^2*displacement(i+1));    
end
SD=max(abs(displacement));
SV=max(abs(vol));
SA=max(abs(acc2));
tmpt=[SD SV SA]

end

