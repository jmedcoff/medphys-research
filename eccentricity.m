function ecc = eccentricity(a)

F=a(6);
E=a(5);
D=a(4);
C=a(3);
B=a(2);
A=a(1);

numer = 2*sqrt((A-C)**2 + B**2);

matr = [[A B/2 D/2]; [B/2 C E/2]; [D/2 E/2 F]];

eta = -(sign(det(matr)));

denom = eta*(A+C) + sqrt((A-C)**2 + B**2);

ecc = sqrt(numer/denom);
end