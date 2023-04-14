function vec = getEllipsoidNormal(ellipsoid_coord, point)
    % Get the normal vector of a point on an ellipsoid.
    a = ellipsoid_coord(1);
    b = ellipsoid_coord(2);
    c = ellipsoid_coord(3);
    x = point(1);
    y = point(2);
    z = point(3);

    vec = [2 * x / a^2, 2 * y / b^2, 2 * z / c^2];
    vec = getUnitVector([0 0 0], vec);
end
