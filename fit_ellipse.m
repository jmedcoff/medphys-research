function a=fit_ellipse(x,y)

%if you have problems with matrix dimensions agreeing, try using
%fit_ellipse(x',y') instead of fit_ellipse(x,y)

%build (D)esign matrix

D=[ (x.*x) (x.*y) (y.*y) x y (ones(size(x))) ];
%Note: all of the transpositions are necessary when entering x and y as row vectors such as x = [ 1.000 2.000 3.000 ]

%build (S)catter matrix

S=D'*D;

%build (C)onstraint matrix

C=zeros(6,6); C(1,3)=-2; C(2,2)=1; C(3,1)=-2;

%solve the generalized eigensystem

[gevec,geval]=eig(S,C);

%find the only negative eigenvalue (use -1e-9 instead of 0)

[NegR,NegC]=find(geval<-1e-9 & ~isinf(geval));

%get fitted parameters

a=gevec(:,NegC);