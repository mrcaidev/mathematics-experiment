boundary = 30 * 60;

cnt = 0;
acc = 0;

while (true)
    tick = 5 * rand;
    acc = acc + tick;

    if acc > boundary
        break
    else
        cnt = cnt + 1;
    end

end

disp(cnt);
