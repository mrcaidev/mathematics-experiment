function vec = getUnitVector(pointA, pointB)
    % Get the unit vector pointing from A to B.
    dx = pointB(1) - pointA(1);
    dy = pointB(2) - pointA(2);
    dz = pointB(3) - pointA(3);

    vec = [dx, dy, dz];
    vec = vec / norm(vec);
end
