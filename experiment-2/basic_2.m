syms x;
f = exp(2 * cos(x)) * cos(x);
res = int(f, 0, pi);
fprintf('Result = %f\n', res);
