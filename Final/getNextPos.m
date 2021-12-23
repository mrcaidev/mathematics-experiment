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
