function J = compute_cost( x, y, beta )
%COMPUTE_COST Summary of this function goes here
%   Detailed explanation goes here
J = sum(((x*(beta)) - y).^2);
end

