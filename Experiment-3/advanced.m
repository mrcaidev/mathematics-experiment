function x = advanced()
    trange = 0:0.1:100;
    init = [2 0];
    [t, ret] = ode23(@f, trange, init);
    x = ret(:,1);
    plot(t, x);
    xlabel('t');
    ylabel('x');
    disp(length(x));
end

function ret = f(~, x)
    ret = [x(2); 20*(1-x(1)^2)*x(2)+0.5*x(1)];
end