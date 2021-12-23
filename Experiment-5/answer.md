# 实验 5：随机模拟实验

## 基础训练 1

假设学生到达图书馆的间隔时间服从在区间 $[0,5]$（单位：秒）上的均匀分布，请编程产生 100 个学生的到达时刻。

```Matlab
ticks = 5 * rand(1, 100);
```

## 基础训练 2

假设在某 30 分钟内学生到达图书馆的间隔时间服从在区间 $[0,5]$（单位：秒）上均匀分布，请编程产生 30 分钟内所有到达图书馆的学生的到达时刻，并输出到达人数。

```Matlab
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
```

## 综合训练

请用蒙特卡罗法求解下列优化模型：

$$
\min{f(x)=2(x_1-1)^2+3(x_2-4)^2+x_1x_2+(2x_3-5)^2}\\
s.t. \begin{cases}
    3x_1+2x_2+6x_3\le 20\\
    4x_1+5x_2+2x_3\le 21\\
    0\le x_1\le 15\\
    0\le x_2\le 9\\
    0\le x_3\le 25, x_3\in Z
\end{cases}
$$

```Matlab
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
```