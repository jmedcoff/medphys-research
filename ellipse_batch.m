function A = ellipse_batch(u, apd, start, inc, last)

# This will run elliptical fitting on multiple sequential phase space plots,
# determined by start, inc, and last. For example, calling with start = 1,
# inc = 0.2, and last = 1.6 will return a four column matrix where each column
# corresponds to 1 ms, 1.2 ms, 1.4, and 1.6, respectively.
# Good for automating the collection of data from multiple phase space plots
# without having to call these beefy functions by hand, and keep track of the
# data between each call.

dt = 0.04;
A = [];

for i = start:inc:last
  [x ,y] = phase_adaptive(u, dt, i, apd);
  A = [A fit_ellipse(x', y')];
end
end