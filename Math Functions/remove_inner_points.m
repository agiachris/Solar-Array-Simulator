function [points] = remove_inner_points(unfiltered_points)
%   The function uses convhull to return the set of points that form the
%   convex polygon (neglecting inner points)
    indices = convull(unfiltered_points);
    points = unfiltered_points(indices, 1:end);
end

