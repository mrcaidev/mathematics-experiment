# 实验 4：最优化模型实验

## 基础训练 1

求一元函数 $f(x)=e^xx\sin{x}$ 在区间 $[0,9]$ 内的最大值点、最大值，并绘制出函数图形，编写 function 程序文件返回 2 个参数，依次返回最大值点、最大值。

```Matlab
function [xmax, fmax] = basic_1()
    [xmax, fmax] = fminbnd(@f, 8, 9);
    fmax = -fmax;
end

function r = f(x)
    r = -exp(x) * x * sin(x);
end
```

## 基础训练 2

求解下列线性规划模型：

$$
\max{f(x_1, x_2, x_3)}=2.5x_1+5x_2+10x_3\\
s.t. \begin{cases}
    x_1+x_2+x_3=100\\
    2.5x_1+5x_2+10x_3\ge 50\\
    x_3\le 2(x_1+x_2)\\
    10\le x_1\le 30\\
    0\le x_2\le 90\\
    20\le x_3\le 80
\end{cases}
$$

```Matlab
function z = basic_2()
    C = [-2.5 -5 -10];
    A = [
        -2.5 -5 -10;
        -2 -2 1
        ];
    b = [50; 0];
    Aeq = [1 1 1];
    Beq = 100;
    Lb = [10; 0; 20];
    Ub = [30; 90; 80];
    x = linprog(-C, A, b, Aeq, Beq, Lb, Ub);
    disp(x);
    z = -C * x;
end
```

## 综合训练

某工厂有三种原料 $C_1$、$C_2$、$C_3$，其储量分别为 150 公斤，160 公斤和 180 公斤。现在用来生产甲、乙两种产品。已知每生产 1 公斤产品甲需要原料 $C_1$ 3 公斤，原料 $C_2$ 6 公斤，原料 $C_3$ 2 公斤。每生产 1 公斤产品乙需要原料 $C_1$ 5 公斤，原料 $C_2$ 5 公斤，原料 $C_3$ 6 公斤。又已知生产 1 公斤产品甲利润为 17 元，生产 1 公斤产品乙利润为 15 元。请为该工厂制定生产计划，使得利润尽可能大。

```Matlab
function z = advanced()
    C = [-17 -15];
    A = [3 5; 6 5; 2 6];
    b = [150; 160; 180];
    Aeq = [];
    Beq = [];
    Lb = [0; 0];
    Ub = [inf; inf];
    x = linprog(C, A, b, Aeq, Beq, Lb, Ub);
    z = -C * x;
end
```