function [f, df] = NewtonZeroTestFunct2(x)
%
% [f, df] = NewtonZeroTestFunct2(x)
%
% Sample test function for Newton's method.
% Implements: f(x) = cos(x) - x, with derivative df(x) = -sin(x) - 1
%
% INPUT:
%   x  - Input value (scalar or vector)
%
% OUTPUT:
%   f  - Function value at x
%   df - Derivative value at x
%

f = cos(x) - x;
df = -sin(x)-1;

return