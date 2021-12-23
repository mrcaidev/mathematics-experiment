function next = getNextPos(ellipsoid_coord, cur, normal_vector)
    % Get the rectangular coordinate the next step should land on.
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

function next_polars = getPossibleNextPolars(cur_polar)
    % Get possible polar coordinates to land the next step.
    radius = 0.01;
    precision = 0.001;
    cur_theta = cur_polar(1);
    cur_alpha = cur_polar(2);
    num = 2 * radius / precision + 1;

    theta_directions = linspace(cur_theta - radius, cur_theta + radius, num);
    alpha_directions = linspace(cur_alpha - radius, cur_alpha + radius, num);
    [theta_directions, alpha_directions] = meshgrid(theta_directions, alpha_directions);
    theta_directions = reshape(theta_directions, [1 num^2]);
    alpha_directions = reshape(alpha_directions, [1 num^2]);

    next_polars = [theta_directions; alpha_directions];
end
