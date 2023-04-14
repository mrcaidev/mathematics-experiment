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
