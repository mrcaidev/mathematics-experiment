function ret = basic_1(a, k)
    % x = k*a
    syms x;
    y = a * exp(x) / sqrt(a + x^2);
    dy = diff(y);
    ret = subs(dy, x, k * a);
end
