function [f, df] = NewtonZeroTestFunct1(x)
%
% [f, df] = NewtonZeroTestFunct1(x)
%
% Sample test function for Newton's method.
% Implements: f(x) = x^2 - 2, with derivative df(x) = 2x
%
% INPUT:
%   x  - Input value (scalar or vector)
%
% OUTPUT:
%   f  - Function value at x
%   df - Derivative value at x
%

f = x.^2 - 2;
df = 2*x;

return