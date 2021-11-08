syms x;
f = exp(x);
X = -3:0.1:3;

f_plot = subs(f, x, X);
plot(X, f_plot, 'k', 'linewidth', 2);
hold on;

order = 5;

for i = 1:order
    f_taylor = taylor(f, x, 'expansionpoint', 0, 'order', i);
    f_plot = subs(f_taylor, x, X);
    plot(X, f_plot);
end

grid on;
hold off;
