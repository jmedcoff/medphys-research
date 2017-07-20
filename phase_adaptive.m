function [x,y] = phase_adaptive(u, dt, delta_t, apd_x, shamt)

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
  

adj_potential = max(u) * (1-apd_x);


for i = 2:(length(u) - 1)
  if (u(i-1) <= adj_potential & u(i) >= adj_potential)
    first = i;
    end
  if (u(i-1) >= adj_potential & u(i) <= adj_potential)
    last = i-1;
    end
  if (u(i-1) <= u(i) & u(i) >= u(i+1))
    max = i;
    end
  end

upstroke = u(first:max);
downstroke = u(max:last);

ratio = length(upstroke)/length(downstroke);
uprate = (delta_t*ratio)/(2*dt);
downrate = (delta_t*2)/(ratio*dt);

x = [upstroke(1:uprate:end) downstroke(1:downrate:end-shamt)];
y = [upstroke(shamt:uprate:end) downstroke(1:downrate:end)];
x = x(1:length(y));
end
