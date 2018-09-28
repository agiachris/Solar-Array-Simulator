function [total_area] = area_of_nsided_convex_polygon(vertices)
%   This function determines the total area inside a convex polygon by
%   computing the determinant of the matrix containing the vertices

    s = size(vertices);
    N = s(1);
    k = convhull(vertices); % Necessary because points of convex polygon  
                            % must be arranged in clockwise order in mat
    mat = [vertices(k, 1:end); vertices(k(end), 1:end)];
    a = 0;
    b = 0;
    for i=1:N
        a = a + mat(i, 1)*mat(i+1, 2);
        b = b + mat(i, 2)*mat(i+1, 1);
    end 
    total_area = 0.5*(a-b);
end