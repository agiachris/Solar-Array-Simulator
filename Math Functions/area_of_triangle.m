function [area] = area_of_triangle(three_by_three)
%   Compute the cross product of vectors p2p1 and p3p1 to compute the area
%   of a triangle in 3D space
    p2p1 = three_by_three(2, 1:3) - three_by_three(1, 1:3);
    p3p1 = three_by_three(3, 1:3) - three_by_three(1, 1:3);
    v3 = cross(p2p1, p3p1);
    area = 0.5*sqrt(sum(v3.^2));
end

