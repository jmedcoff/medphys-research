% To plot into phase space: u(t) against u(t + delta_t)
% within the range of APD_X (APD_90, APD_95, etc.)
% dt is the time interval between potential values in u,
% i.e. the duration between u(1) and u(2).
% delta_t must be an integer multiple of dt.

function [x_vals, y_vals] = phase_space(u, dt, delta_t, apd_x)

warning('off', 'Octave:possible-matlab-short-circuit-operator');

if !(isvector(u))
  error("expected argument \"u\" to be a vector");
  end
  
if !(dt>0 & delta_t>0 & apd_x>0)
  error("arguments must be nonnegative");
  end
  
if (rem(delta_t, dt) != 0)
  error("\"delta_t\" must be a multiple of \"dt\"");
  end
  

% Use max potential to calculate adj_potential
max_potential = max(u);
adj_potential = max_potential * (1-apd_x);

% Find the indices of the action potential where voltage 
% exceeds adj_potential, and where it deceeds.
% (The word "exceed" does not have an antonym)
first = 1;
last = 1;
max = 1;

for i = 2:(length(u) - 1)
  if (u(i-1) <= adj_potential & u(i) >= adj_potential)
    first = i;
    end
  if (u(i-1) >= adj_potential & u(i) <= adj_potential)
    last = i-1;
    end
  end
  
% Get the relevant values (spaced apart by delta_t)
u_subset = u(first:delta_t/dt:last);
x_vals = u_subset(1:end-1);
y_vals = u_subset(2:end);

end