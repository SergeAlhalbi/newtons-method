function [x,iter] = NewtonZeroSolver( fhndl, x0, varargin )
%
% [x,iter] = NewtonZeroSolver( fhndl, x0, OPTIONS )
%
% Newton's root finding method for specified function and initial value.
%
% INPUTS:
%
%   fhndl - Function handle used by feval to get the function and derivative values, repsectively
%
%   x0 - Initial root (zero) estimate to start the iterative process with
%
% OPTIONS (string-value pairs):
%
%   'maxIters' - Maximum number of iterations
%                DEFAULT: 10
%
%   'verbose' - A binary flag that controls whether the solution is printed to screen
%               DEFAULT: false -> NO printing of progress
%
%   'tol' - Tolerance on the relative for enabling early exiting of iteration
%           DEFAULT: -1 -> no tolerance checking
%
% OUTPUTS:
%
%   x - Estimated root (zero) value
%
%   iter - Last iteration number

% Set defaults
names = {'maxIters', 'verbose', 'tol'};
defaults = {10,false,-1};
[ errMsg, maxIters, verbose, tol ] = CheckInputs( names, defaults, varargin{:} );
error(errMsg);

% Initialize
x = x0;
iter = 0;

% Execute Newton iterations
while iter <= maxIters
    
    % Get the function and associated derivative values
    [f,df] = feval(fhndl,x);
        
    % Non-zero derivative value
    if df ~= 0
        
        % Update
        x2 = x - f/df;
        
        % Tolerance test?
        if ( tol >= 0 )
            err = abs(x2 - x);
            if err < abs(x)*tol
                break
            else
                x = x2;
            end
        else
            x = x2;
        end
        
        % Print progress
        if verbose
            fprintf(1,'Iter %3d:   %5.15f\n', iter, x );
        end
        
    else        
        
        warning(['Derivative value of zero: exiting at iteration ', int2str(iter), ' of ', int2str(maxIters)]);
        break
        
    end
    
    % Increment iteration
    iter = iter + 1;
    
end

return