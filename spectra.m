function [ result ] = spectra( damp,dt,acc)
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
T=linspace(0.001,10,50)';
omega=2*pi()./T;
result=zeros(50,4);
for i=1:50
   result(i,2:4)=getMax( damp,dt,omega(i),acc);
end
result(:,1)=T;
end

