function distance = getDistance(pointA, pointB)
    % Calculate the distance between A and B.
    distance = sqrt((pointB(1) - pointA(1))^2 + (pointB(2) - pointA(2))^2 + (pointB(3) - pointA(3))^2);
end
