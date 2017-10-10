function [iter, f ] = quad1(a,eta)

global x1i threshold maxiter anim;

x1a = (-10:10)';


y(x1a+11) = a * x1a.^2 / 2;

figure(1), clf
plot(x1a,y,'b-')
hold on

x1 = x1i;
f = a * x1^2 / 2;
fold = f;

iter = 0;

x1old = x1;
while f > threshold | isnan(f)
   iter = iter + 1;
   if iter > maxiter, break, end
   x1 = x1 - eta * a * x1;
   fold = f;
   f = a * x1^2 / 2;
   plot([x1old x1], [fold f], 'r.-')
   x1old = x1;
   if anim, pause(.01), end
end

if iter <= maxiter
   fprintf('Converged in %d steps, f = %f\n', iter, f)
else
   fprintf('Did not converge in %d steps, f = %g\n', maxiter, f)
end
