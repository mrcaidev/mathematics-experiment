syms n;
sum = [1];
err = [exp(1) - 1];
order = 5;
factorial = 1;

for i = 1:order
    factorial = factorial * i;
    sum(i + 1) = sum(i) + 1 / factorial;
    err(i + 1) = abs(exp(1) - sum(i + 1));
end

subplot(1, 2, 1);
plot(0:order, sum, '-o');
title('Approximation');
subplot(1, 2, 2);
plot(0:order, err, '-o');
title('Deviation');
