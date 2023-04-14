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
