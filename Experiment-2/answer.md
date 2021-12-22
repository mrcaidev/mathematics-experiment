# 实验 2：微积分实验

## 基础训练 1

已知函数 $y=\frac{ae^x}{\sqrt{a+x^2}}$，求解该函数在以下情形对应点 $x$ 处的二阶导数值。

1. $a=2,x=3a$；
2. $a=3,x=2a$。

```Matlab
function ret = basic_1(a, k)
    % x = k*a
    syms x;
    y = a * exp(x) / sqrt(a + x^2);
    dy = diff(y);
    ret = subs(dy, x, k * a);
end
```

## 基础训练2

编写程序用符号工具箱函数求定积分 $\int_{0}^{\pi}e^{2\cos{x}}\cos xdx$。

```Matlab
syms x;
f = exp(2 * cos(x)) * cos(x);
res = int(f, 0, pi);
```

## 综合训练

已知函数 $y=y(x)$ 在若干个点的函数值，具体数据见源码。请找出函数在 $[0,12]$ 区间上的所有可能的拐点。

```Matlab
data = [0.0 2.4051; ..; 11.8 0.1913];

x = data(:, 1);
y = data(:, 2);
len = length(x);
delta = 0.2;

list = [(y(3) + y(1) - 2 * y(2)) / (delta^2)];

for index = 4:len
    ddy = (y(index) + y(index - 2) - 2 * y(index - 1)) / (delta^2);
    list = [list, ddy];

    if (sign(list(index - 3)) ~= sign(ddy))
        disp(x(index - 2));
    end

end
```
