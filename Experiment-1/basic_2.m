x = [0 1];

for index = 3:40
    x(index) = x(index - 1) + x(index - 2);
end

disp(x);
