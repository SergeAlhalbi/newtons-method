%% Newton’s Method Demo – Test Both Functions
clear; clc; close all

addpath(genpath('core'));
addpath(genpath('utils'));
addpath(genpath('tests'));

testCases = {
    @NewtonZeroTestFunct1, 'f(x) = x^2 - 2', 0.5, [-2, 2];
    @NewtonZeroTestFunct2, 'f(x) = cos(x) - x', 1.0, [0, 2]
    };

for i = 1:size(testCases, 1)
    fhndl = testCases{i, 1};
    description = testCases{i, 2};
    x0 = testCases{i, 3};
    xrange = testCases{i, 4};

    % Solve using Newton's method
    [x, iter] = NewtonZeroSolver(fhndl, x0, ...
        'maxIters', 20, ...
        'verbose', true, ...
        'tol', 1e-6);

    % Evaluate function over range for plotting
    xx = linspace(xrange(1), xrange(2), 400);
    yy = arrayfun(@(v) fhndl(v), xx, 'UniformOutput', false);  % each element is [f, df]
    fvals = cellfun(@(z) z(1), yy);  % extract f(x) only

    % Plot
    figure(i)
    plot(xx, fvals, 'b', 'LineWidth', 1.5); hold on; grid on;
    plot(x, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    xlabel('x'); ylabel('f(x)');
    title(sprintf('Newton’s Method: %s\nRoot = %.6f in %d iterations', description, x, iter));
    legend('f(x)', 'Estimated Root', 'Location', 'Best');

end