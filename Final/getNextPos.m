function next = getNextPos(ellipsoid_coord, cur, normal_vector)
    % Get the position the next step should land on.
    cur_polar = rectToPolar(ellipsoid_coord, cur);
    next_polars = getPossibleNextPolars(cur_polar);
    max_product = 0;
    next = [0 0 0];

    for next_polar = next_polars
        next_rect = polarToRect(ellipsoid_coord, next_polar);
        next_unit = getUnitVector(cur, next_rect);
        product = next_unit * normal_vector';

        if product > max_product
            max_product = product;
            next = next_rect;
        end

    end

end

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
