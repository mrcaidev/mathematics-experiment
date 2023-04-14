load SH600004.mat;
close_index = 5;

x = 1:100;
close = [];
raise = [];

for day = length(M) - 99:length(M)
    close = [close M(day, close_index)];
    raise = [raise M(day, close_index) / M(day - 1, close_index)];
end

subplot(3, 1, 1);
scatter(x, close);
hold on;
plot(x, close);
title('Closing price in past 100 days')
xlabel('Day number')
ylabel('Closing price');
grid on;
hold off;

subplot(3, 1, 2);
scatter(x, raise);
hold on;
plot(x, raise);
title('Rise in past 100 days');
xlabel('Day number')
ylabel('Rise');
grid on;
hold off;

subplot(3, 1, 3);
bar(x, raise);
title('Rise in past 100 days');
xlabel('Day number')
ylabel('Rise');
grid on;
