% This function plots a conic section in cartesian coordinates from the general equation

function plot_ellipse(A,y)

%A is the coefficient array A=(a b c d e f)'
%y is a vector of the form y=miny:spacing:maxy;

a=A(1); b=A(2); c=A(3); d=A(4); e=A(5); f=A(6);

n=length(y); x1j=1; x2j=1;

for i=1:n
%the coefficients of the quadratic equation
%    qeA=a;
    qeB=b*y(i) + d;
    qeC=c*(y(i)^2) + e*y(i) + f;

    x1(i)= ( -qeB + ( qeB^2 - 4*a*qeC )^0.5 )/(2*a);
    x2(i)= ( -qeB - ( qeB^2 - 4*a*qeC )^0.5 )/(2*a);
    
    %sorts for true (i.e. real values)
    if isreal(x1(i))==1
        x1re(x1j)=x1(i); x1rey(x1j)=y(i); x1j=x1j+1;
    end
    if isreal(x2(i))==1
        x2re(x2j)=x2(i); x2rey(x2j)=y(i); x2j=x2j+1;
    end
    
end

hold on;

plot(x1re(1:(x1j-1)),x1rey(1:(x1j-1)),'k'); plot(x2re(1:(x2j-1)),x2rey(1:(x2j-1)),'k');