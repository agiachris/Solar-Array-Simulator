function [points_reduced] = shading(points, vertices)
%   Evaluates if a point is located within the convex hull of any number of
%   vertices (forming any number of triangles) and includes the point if it
%   is
    k = convhull(vertices);
    s = size(points);
    N = s(1);
    in = 0;
    on = 0;
    reduced = [];
    for i=1:N
        [in, on] = inpolygon(points(i, 1), points(i, 2), vertices(k, 1), vertices(k, 2));
        if in == 1 || on == 1
            reduced = [reduced; points(i, 1:end)];
            in = 0;
            on = 0;
        end
    end
    points_reduced = reduced;
end