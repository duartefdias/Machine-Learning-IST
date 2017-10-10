clear z

x2a = (-1:.02:3);

for x1a=-2:.02:2
   z(floor(50*x1a+101.5),:) = (1 - x1a)^2 + a * (x2a - x1a^2).^2;
end

z = z';

v=floor(a/80)+3:floor(a):max(max(z));

figure(1), clf
contour(z,v,'b'), axis square
set(gca,'XTick',[1 51 101 151 201])
set(gca,'XTickLabel',[-2 -1 0 1 2])
set(gca,'YTick',[1 51 101 151 201])
set(gca,'YTickLabel',[-1 0 1 2 3])

hold on

plot(151,101,'b.')

x1 = x1i;
x2 = x2i;

z1 = 0;
z2 = 0;

eta1 = eta;
eta2 = eta;

grad1old = 0;
grad2old = 0;

f = (1 - x1)^2 + a * (x2 - x1^2)^2;
fold = f;
minf = f;

iter = 0;

plot(50 * x1 + 101, 50 * x2 + 51,'r.')
x1old = x1;
x2old = x2;
while f > threshold | fold > threshold
   iter = iter + 1;
   if iter > maxiter, break, end
   grad1 = - 2 * (1 - x1) - 4 * a * (x2 - x1^2) * x1;
   grad2 = 2 * a * (x2 - x1^2);
   
   if f > minf & reduce < 1
      x1 = minx1;
      x2 = minx2;
      grad1 = mingrad1;
      grad2 = mingrad2;
      z1 = 0;
      z2 = 0;
      eta1 = eta1 * reduce;
      eta2 = eta2 * reduce;
      grad1old = 0;
      grad2old = 0;
      fold = f;
      f = minf;
   else
      minf = f;
      minx1 = x1;
      minx2 = x2;
      mingrad1 = grad1;
      mingrad2 = grad2;
      if grad1 * grad1old > 0
         eta1 = eta1 * up;
      else
         eta1 = eta1 * down;
      end
      if grad2 * grad2old > 0
         eta2 = eta2 * up;
      else
         eta2 = eta2 * down;
      end
      z1 = alfa * z1 - (1 - alfa) * grad1;
      z2 = alfa * z2 - (1 - alfa) * grad2;
      x1 = x1 + eta1 * z1;
      x2 = x2 + eta2 * z2;
      grad1old = grad1;
      grad2old = grad2;
      fold = f;
      f = (1 - x1)^2 + a * (x2 - x1^2)^2;
   end
   plot(50 * [x1old x1] + 101, 50 * [x2old x2] + 51, 'r.-')
	if anim, pause(0), end
   x1old = x1;
   x2old = x2;
end

if iter <= maxiter & abs(x1) < 2 & abs(x2) < 2
   fprintf('Converged in %d steps, f = %g\n', iter, f)
else
   fprintf('Did not converge in %d steps, f = %g\n', maxiter, f)
end
% 
% fprintf('Function value: %f\n', (1 - x1)^2 + a * (x2 - x1^2)^2)
