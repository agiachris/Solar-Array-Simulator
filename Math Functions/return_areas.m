function [area] = return_areas(vertices)
%   Given vertices that create any number of triangles, the total area can
%   be computed by removing the inner points and solving for the area of
%   the convex polygon made of all the outer points
    points = remove_inner_points(vertices);
    area = area_of_n_sided_polygon(points);
end

