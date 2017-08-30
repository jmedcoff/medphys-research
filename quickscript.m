function ecc = quickscript(u)

# initialize data
ecc = [];
dt = 0.04;

# get the x, y of the phase space plot
[x,y] = phase_adaptive(u, dt, 25*dt, 0.9);

# fit the plot and add its eccentricity to the batch
ecc = eccentricity(fit_ellipse(x', y'));

