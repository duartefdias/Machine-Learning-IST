
x2a = (-10:10);

for x1a=-10:10
   z(x1a+11,:) = (x1a^2 + a * x2a.^2) / 2;
end

z = z';

v=10:40:max(max(z));

figure(1), clf
contour(z,10,'b'), axis square
set(gca,'XTick',[1 6 11 16 21])
set(gca,'XTickLabel',[-10 -5 0 5 10])
set(gca,'YTick',[1 6 11 16 21])
set(gca,'YTickLabel',[-10 -5 0 5 10])

hold on

x1 = x1i;
x2 = x2i;
f = (a*x1^2 + x2^2) / 2;
fold = f;

dx1 = 0;
dx2 = 0;

iter = 0;

plot(x1+11,x2+11,'r.')
x1old = x1;
x2old = x2;
while f > threshold | isnan(f)
   iter = iter + 1;
   if iter > maxiter, break, end
   dx1 = alfa * dx1 + (1 - alfa) * x1;
   dx2 = alfa * dx2 + (1 - alfa) * a * x2;
   x1 = x1 - eta * dx1;
   x2 = x2 - eta * dx2;
   fold = f;
   f = (a*x1^2 + x2^2) / 2;
   plot([x1old x1] + 11, [x2old x2] + 11, 'r.-')
   x1old = x1;
   x2old = x2;
   if anim, pause(.01), end
end

if iter <= maxiter
   fprintf('Converged in %d steps, f = %f\n', iter, f)
else
   fprintf('Did not converge in %d steps, f = %g\n', maxiter, f)
end
