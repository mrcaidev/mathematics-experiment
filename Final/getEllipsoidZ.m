function z = getEllipsoidZ(ellipsoid_coord, point)
    % Get Z coordinate of a point on an ellipsoid.
    a = ellipsoid_coord(1);
    b = ellipsoid_coord(2);
    c = ellipsoid_coord(3);
    x = point(1);
    y = point(2);

    z = c * sqrt(1 - x^2 / a^2 - y^2 / b^2);
end
