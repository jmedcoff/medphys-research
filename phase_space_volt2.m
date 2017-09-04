% Plots into phase space using sampled potential instead of time intervals.
% This has shown to be completely useless, as plotting this way will always
% give linear behaviour.
function [x_vals, y_vals] = phase_space_volt2(u, dv, apd_x)

errortolerance = 0.05;

warning('off', 'Octave:possible-matlab-short-circuit-operator');

if !(isvector(u))
  error("expected argument \"u\" to be a vector");
end
  
if !(dv>0 & apd_x>0)
  error("arguments must be nonnegative");
end

maxpot = max(u);
adj_potential = maxpot * (1-apd_x);

first = 1;
last = 1;

for i = 2:length(u)
  if (u(i-1) <= adj_potential & u(i) >= adj_potential)
    first = i;
  end
  if (u(i-1) >= adj_potential & u(i) <= adj_potential)
    last = i-1;
  end
end

uprime = u(first:last);

uvals1 = uprime(1):dv:maxpot;
uvals2 = maxpot:-dv:uprime(end);
uvals = [uvals1 uvals2];

x_vals = uvals(1:end-1);
y_vals = uvals(2:end);
end