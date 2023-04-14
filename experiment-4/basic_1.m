function [xmax, fmax] = basic_1()
    [xmax, fmax] = fminbnd(@f, 8, 9);
    fmax = -fmax;
end

function r = f(x)
    r = -exp(x) * x * sin(x);
end
