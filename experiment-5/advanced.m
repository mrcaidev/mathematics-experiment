function [x_min, f_min] = advanced()
    x_min = [0 0 0];
    f_min = inf;
    n = 1e6;

    for i = 1:n
        x1 = 15 * rand;
        x2 = 9 * rand;
        x3 = fix(25 * rand);

        if (3 * x1 + 2 * x2 + 6 * x3 > 20) || (4 * x1 + 5 * x2 + 2 * x3 > 21)
            continue
        else
            r = f([x1 x2 x3]);
        end

        if r < f_min
            x_min = [x1 x2 x3];
            f_min = r;
        end

    end

end

function r = f(x)
    r = 2 * (x(1) - 1)^2 + 3 * (x(2) - 4)^2 + x(1) * x(2) + (2 * x(3) - 5)^2;
end
