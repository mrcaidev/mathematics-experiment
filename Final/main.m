a = 6000;
b = 5000;
ellipsoid_coord = [a a b];
P1 = [2200 3600];
P2 = [2900 3300];
goal = 5;
total_distance = 0;

P1 = [P1 getEllipsoidZ(ellipsoid_coord, P1)];
P2 = [P2 getEllipsoidZ(ellipsoid_coord, P2)];
P2_normal = getEllipsoidNormal(ellipsoid_coord, P2);

cur_pos = P1;
nexts = [];

while (true)
    next_pos = getNextPos(ellipsoid_coord, cur_pos, P2_normal);
    nexts = [nexts; next_pos];
    walked_distance = getDistance(cur_pos, next_pos);
    total_distance = total_distance + walked_distance;
    dst_distance = getDistance(next_pos, P2);

    if dst_distance < goal
        break
    else
        cur_pos = next_pos;
    end

end

[theta, alpha] = meshgrid(linspace(0, pi / 2, 50), linspace(0, 2 * pi, 50));
z = b * sin(theta);
x = a * cos(theta) .* cos(alpha);
y = a * cos(theta) .* sin(alpha);
mesh(x, y, z)
hold on;

plot3(P1(1), P1(2), P1(3), 'r.', 'markersize', 24)
plot3(P2(1), P2(2), P2(3), 'r.', 'markersize', 24)
plot3(nexts(:, 1), nexts(:, 2), nexts(:, 3), 'r.', 'markersize', 24)
