data = [
    0.0, 2.4051;
    0.2, 2.8759;
    0.4, 3.4072;
    0.6, 3.9690;
    0.8, 4.5147;
    1.0, 4.9844;
    1.2, 5.3149;
    1.4, 5.4541;
    1.6, 5.3752;
    1.8, 5.0849;
    2.0, 4.6224;
    2.2, 4.0482;
    2.4, 3.4297;
    2.6, 2.8260;
    2.8, 2.2793;
    3.0, 1.8125;
    3.2, 1.4322;
    3.4, 1.1336;
    3.6, 0.9059;
    3.8, 0.7364;
    4.0, 0.6131;
    4.2, 0.5258;
    4.4, 0.4668;
    4.6, 0.4302;
    4.8, 0.4125;
    5.0, 0.4114;
    5.2, 0.4263;
    5.4, 0.4575;
    5.6, 0.5064;
    5.8, 0.5748;
    6.0, 0.6648;
    6.2, 0.7776;
    6.4, 0.9129;
    6.6, 1.0671;
    6.8, 1.2324;
    7.0, 1.3961;
    7.2, 1.5416;
    7.4, 1.6501;
    7.6, 1.7052;
    7.8, 1.6966;
    8.0, 1.6234;
    8.2, 1.4945;
    8.4, 1.3263;
    8.6, 1.1387;
    8.8, 0.9503;
    9.0, 0.7756;
    9.2, 0.6233;
    9.4, 0.4971;
    9.6, 0.3965;
    9.8, 0.3188;
    10.0, 0.2605;
    10.2, 0.2178;
    10.4, 0.1875;
    10.6, 0.1670;
    10.8, 0.1546;
    11.0, 0.1490;
    11.2, 0.1496;
    11.4, 0.1565;
    11.6, 0.1701;
    11.8, 0.1913;
    ];

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

disp(list);