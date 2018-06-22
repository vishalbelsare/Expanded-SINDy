function [t,x,dx] = xDeriv(t,x)
%XDERIV Differentiates multivariate time series x (central difference)
%   x is nStep * nVar time series
%   t is nStep * 1 time coordinates
%   output is shorter than input due to truncation at the ends (central
%   differencing)


outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

