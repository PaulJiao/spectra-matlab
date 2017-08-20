function [tmpt ] = onestep(acc1,acc2,vol1,disp1,A,B)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
x1=[disp1;vol1];
a1=[acc1;acc2];
x2=A*x1+B*a1;
tmpt=x2;
end

