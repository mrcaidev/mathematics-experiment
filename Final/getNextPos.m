function next_pos = getNextPos(ellipsoid_axes, cur, normal_vector)
    % Get the rectangular coordinate the next_pos step should land on.
    max_product = 0;
    next_pos = [0 0 0];

    cur_polar = rectToPolar(ellipsoid_axes, cur);
    next_polars = getNextPolars(cur_polar);

    for next_polar = next_polars
        next_rect = polarToRect(ellipsoid_axes, next_polar);
        next_unit = getUnitVector(cur, next_rect);
        product = next_unit * normal_vector';

        if product > max_product
            max_product = product;
            next_pos = next_rect;
        end

    end

end

function rect_coord = polarToRect(ellipsoid_axes, polar_coord)
    % Convert polar coordinates to rectangular coordinates.
    a = ellipsoid_axes(1);
    b = ellipsoid_axes(2);
    c = ellipsoid_axes(3);
    theta = polar_coord(1);
    alpha = polar_coord(2);

    x = a * cos(theta) * cos(alpha);
    y = b * cos(theta) * sin(alpha);
    z = c * sin(theta);

    rect_coord = [x y z];
end

function polar_coord = rectToPolar(ellipsoid_axes, rect_coord)
    % Convert rectangular coordinates to polar cordinates.
    a = ellipsoid_axes(1);
    b = ellipsoid_axes(2);
    c = ellipsoid_axes(3);
    x = rect_coord(1);
    y = rect_coord(2);
    z = rect_coord(3);

    tan_alpha = (y / b) / (x / a);
    alpha = atan(tan_alpha);

    tan_theta = sqrt((z^2 / c^2) / (x^2 / a^2 + y^2 / b^2));
    theta = atan(tan_theta);

    polar_coord = [theta alpha];
end

function next_polars = getNextPolars(cur_polar)
    % Get all ends of vectors radiating from `cur_polar`, among which the next_pos step will select one.
    radius = 0.01;
    precision = 0.001;
    num = 2 * radius / precision + 1;

    theta = linspace(cur_polar(1) - radius, cur_polar(1) + radius, num);
    alpha = linspace(cur_polar(2) - radius, cur_polar(2) + radius, num);
    [theta, alpha] = meshgrid(theta, alpha);
    theta = reshape(theta, [1 num^2]);
    alpha = reshape(alpha, [1 num^2]);

    next_polars = [theta; alpha];
end
