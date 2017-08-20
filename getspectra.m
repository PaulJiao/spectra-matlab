wave=textread('EQ.txt');
dt=0.01;
wave=reshape(wave',[],1);
acc=wave;
lw=length(wave);
time=linspace(0,lw,lw);
damp=[0 ;0.05 ;0.1];
for i=1:length(damp)
    tmpt=spectra( damp(i,1),dt,acc);
    [m,n]=size(tmpt);
    mat(:,n*(i-1)+1:n*i)=tmpt;
end
plot(mat(:,1),mat(:,2:4))

