function [x,y]=ctrofellipse(a)

% a is the coefficient array of the general conic section

F=a(6);
E=a(5);
D=a(4);
C=a(3);
B=a(2);
A=a(1);

p1=-((B^2)-4*A*C);
%p1=1;
p2=(-2*C*D)+(B*E);
p3=(B*D)-2*A*E;
x=p2/p1;
y=p3/p1;