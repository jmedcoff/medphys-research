function scriptplots(ran, interval)

# This is an extremely powerful function that automates the plotting of data
# about the ellipses fit to phase space trajectories resulting from various
# levels of block. The beauty is that this script is fire-and-forget; once run,
# it will take care of saving to file.

# The parameter "ran" is a range of block values to be iterated over. For
# example, the common one during this summer was [0, 0.02, 0.04, ..., 0.5, 0.75]

# "interval" is the sampling interval to be used, as a multiple of dt. So, if I
# wanted a sampling interval of 1 millisecond, I would pass as an argument
# 1/0.04 = 25.

# saveas() is used instead of print because saveas() takes a string argument
# for the filename, so I can concatenate strings to make a meaningful name of
# each plot.


dt = 0.04;
eccentr = [];
semimaj = [];
semimin = [];

for i = ran
  [x,y] = phase_adaptive(fention(i), dt, interval*dt, 0.9);
  ell = fit_ellipse(x', y');
  ecc = eccentricity(ell);
  sma = semimajor(ell);
  smi = sqrt(sma**2 * (1 - ecc**2));
  
  semimaj = [semimaj sma];
  eccentr = [eccentr ecc];
  semimin = [semimin smi];
end

filename1 = ["semimaj" num2str(interval) ".jpg"];
filename2 = ["semimin" num2str(interval) ".jpg"];
filename3 = ["eccentr" num2str(interval) ".jpg"];

saveas(plot(ran, semimaj), filename1, "jpg");
#plot(ran, semimaj);
#print -djpg filename1

saveas(plot(ran, semimin), filename2, "jpg");
#plot(ran, semimin);
#print -djpg filename2

saveas(plot(ran, eccentr), filename3, "jpg");
#plot(ran, eccentr);
#print -djpg filename3


end