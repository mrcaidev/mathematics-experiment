function [a, b] = basic_3()
    a = [];
    b = [];

    for x = 1:316
        y = (x^2 - x) / 100;

        if fix(y) == y
            a = [a x];
            b = [b y];
        end

    end

end
