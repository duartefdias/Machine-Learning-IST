function beta = normal( x, y, beta )
%NORMAL Summary of this function goes here
%   Detailed explanation goes here
beta = pinv(x'*x)*x'*y;

end

