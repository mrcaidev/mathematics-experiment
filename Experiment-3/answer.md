# 实验 3：数值计算实验

## 基础训练 1

编程调用 `fzero` 求解方程 $2x^3-3x^2+4x-5=0$，并将所求函数调用 `fzero`，并返回 `xp`。

```Matlab
function xp = basic_1()
    xp = fzero(@f, 0);
end

function y = f(x)
    y = 2 * x^3 - 3 * x^2 + 4 * x - 5;
end
```

## 基础训练 2

请用 Euler 法求解下列微分方程：

$$
\begin{cases}
    \frac{dy}{dt}=0.02(1-0.001y)y\\
    y(0)=10
\end{cases}
$$

并将 Euler 求解结果与 Matlab 的 `ode23` 函数求解结果对比。

```Matlab
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
```

## 基础训练3

某种产品在生产过程中的性能指标 $y$ 与它所含的某种材料的含量 $x$ 有关，现将试验所得 16 组数据记录列于表内，详细数据见源码。

要求拟合 $y$ 与 $x$ 的函数关系。用多项式拟合函数 `polyfit` 进行二次多项式拟合。编写函数文件返回 2 个参数：
第 1 个返回参数为二次多项式系数组成的行向量 $p$（元素由高次到低次排列）；
第 2 个返回参数为拟合函数在点 `x=25:0.4:60` 处的函数值（用 1 个行向量表示）。

```Matlab
function [p, v] = basic_3()
    x = [20.05 .. 50.08];
    y = [26.5 .. 631];
    p = polyfit(x, y, 2);
    x_new = 25:0.4:60;
    v = polyval(p, x_new);
end
```

## 综合训练

请用 Matlab 函数 `ode23` 求解下列微分方程：

$$\begin{cases}
    \frac{d^2x}{dt^2}=20(1-x^2)\frac{dx}{dt}+0.5x\\
    x(0)=2;x'(0)=0
\end{cases}$$

编写函数调用 `ode` 工具箱函数返回 $x$ 在点 `0:0.1:100` 处的函数值，用列向量存储这些函数值,并绘制出函数 $x$ 在区间 $[0,100]$ 上的曲线。此列向量为 `double` 型数组。

```Matlab
function x = advanced()
    trange = 0:0.1:100;
    init = [2 0];
    [t, ret] = ode23(@f, trange, init);
    x = ret(:, 1);
    plot(t, x);
    xlabel('t');
    ylabel('x');
    disp(length(x));
end

function ret = f(~, x)
    ret = [x(2); 20 * (1 - x(1)^2) * x(2) + 0.5 * x(1)];
end
```
