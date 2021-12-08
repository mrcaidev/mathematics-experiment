function xp = basic_1()
    xp = fzero(@f, 0);
end

function y = f(x)
    y = 2*x^3 - 3*x^2 + 4*x - 5;
end