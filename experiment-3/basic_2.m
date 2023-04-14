function basic_2()
    trange = [0 300];
    precision = 0.2;
    y0 = 10;
    [t, curve1] = euler(@f, trange, precision, y0);
    plot(t, curve1);
    hold on;
    [t, curve2] = ode23(@f, trange, y0);
    plot(t, curve2);
    xlabel('t');
    ylabel('y');
    legend('Euler', 'ode23');
end

function [t, y] = euler(diffeq, trange, precision, y0)
    t = trange(1):precision:trange(2);
    n = length(t);
    y = y0 * ones(n, 1);

    for k = 2:n
        y(k) = y(k - 1) + 0.2 * feval(diffeq, t(k - 1), y(k - 1));
    end

end

function dydt = f(~, y)
    dydt = 0.02 * (1 - 0.001 * y) * y;
end
