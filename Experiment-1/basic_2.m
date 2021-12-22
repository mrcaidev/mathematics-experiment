n = 40;
x = [0 1];

for index = 3:n
    x(index) = x(index - 1) + x(index - 2);
end
