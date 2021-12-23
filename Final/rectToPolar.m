function polar_coord = rectToPolar(ellipsoid_coord, rect_coord)
    % Convert rectangular coordinates to polar cordinates.
    a = ellipsoid_coord(1);
    b = ellipsoid_coord(2);
    c = ellipsoid_coord(3);
    x = rect_coord(1);
    y = rect_coord(2);
    z = rect_coord(3);

    tan_alpha = (y / b) / (x / a);
    alpha = atan(tan_alpha);

    tan_theta = sqrt((z^2 / c^2) / (x^2 / a^2 + y^2 / b^2));
    theta = atan(tan_theta);

    polar_coord = [theta alpha];
end
