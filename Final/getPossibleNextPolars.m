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
