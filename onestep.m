function [tmpt ] = onestep(acc1,acc2,vol1,disp1,A,B)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
x1=[disp1;vol1];
a1=[acc1;acc2];
x2=A*x1+B*a1;
tmpt=x2;
end

