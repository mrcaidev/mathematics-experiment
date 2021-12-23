function rect_coord = polarToRect(ellipsoid_coord, polar_coord)
    % Convert polar coordinates to rectangular coordinates.
    a = ellipsoid_coord(1);
    b = ellipsoid_coord(2);
    c = ellipsoid_coord(3);
    theta = polar_coord(1);
    alpha = polar_coord(2);

    x = a * cos(theta) * cos(alpha);
    y = b * cos(theta) * sin(alpha);
    z = c * sin(theta);

    rect_coord = [x y z];
end
