function sm = semimajor(a)

# Much like eccentricity(), this function takes the vector of coefficients from
# the general equation, and returns the semimajor axis length.

F=a(6);
E=a(5);
D=a(4);
C=a(3);
B=a(2);
A=a(1);

denom = (A+C) - sqrt((A-C)**2 + B**2);

numer = 2*((A*E**2 - B*D*E + C*D**2)/(4*A*C - B**2) - F);

sm = sqrt(numer/denom);
end