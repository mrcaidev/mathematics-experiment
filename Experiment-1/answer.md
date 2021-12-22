# 实验 1：程序设计基础

## 基础训练 1

将区间 $[55,97]$ 上等间隔的 100 个数据（含区间端点）赋给变量 $v$，并将 $v$ 的元素逆序排列赋给向量 $w$。

```Matlab
v = linspace(55, 97, 100);
w = fliplr(v);
```

## 基础训练 2

数列 $x_n$ 的定义是 $x_1=0$，$x_2=1$，$x_n=x_{n-1}+x_{n-2}(n\ge 3)$。用循环语句编程给出该数列的前 40 项。

> 要求：将结果用行向量 $x$ 存储。

```Matlab
n = 40;
x = [0 1];
for index = 3:n
    x(index) = x(index - 1) + x(index - 2);
end
```

## 基础训练 3

请找出满足 $a^2-100b=a$ 的正整数 $a,b(1\le a,b\le 1000)$。

编写函数依次返回行向量 $a,b$（其中 $a(i),b(i)$ 为第 $i$ 组解），其中数组 $a$ 中元素递增排列。

```Matlab
function [a, b] = basic_3()
    a = [];
    b = [];
    for x = 1:316
        y = (x^2 - x) / 100;
        if fix(y) == y
            a = [a x];
            b = [b y];
        end
    end
end
```

## 基础训练 4

绘制出该只股票最近 100 个交易日内的：

1. 收盘价的曲线和散点图；
2. 涨幅的曲线、散点图、柱状图。

```Matlab
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
```

## 综合训练

用长度为 1200 厘米的条材，分别截成长度为 64 厘米与 85 厘米的两种成品。

请用穷举法找出一根条材的所有切割方式，并给出每种切割方式的具体信息（包括余料长度）。

> 说明：一根条材最多截出 18 根 64 厘米的成品，或 14 根 85 厘米的成品。

```Matlab
for long = 0:14
    short = fix((1200 - 85 * long) / 64);
    remain = 1200 - long * 85 - short * 64;
    fprintf('%2d根85cm, %2d根64cm, 余料%2dcm\n', long, short, remain);
end
```
