function [x,y] = phase_adaptive(u, dt, delta_t, apd_x)

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
    max_u = i;
    end
  end

upstroke = u(first:max_u);
downstroke = u(max_u:last);

ratio = length(upstroke)/length(downstroke);
uprate = (delta_t*ratio)/(2*dt);
downrate = (delta_t*2)/(dt);
uprate = floor(uprate);

x = [upstroke(1:uprate:end-(delta_t/dt)) downstroke(1:downrate:(end-(delta_t/dt)))];
y = [upstroke((delta_t/dt):uprate:end) downstroke((delta_t/dt):downrate:end)];

if (length(x) < length(y))
  y = y(1:length(x));
else
x = x(1:length(y));
end

end
