function [binary] = point_in_triangle(point, triangle)
%   This function returns 1 if the point is in the triangle and 0
%   otherwise.
   
    P1 = triangle(1, 1:end);
    P2 = triangle(2, 1:end);
    P3 = triangle(3, 1:end);
    P = point;
    s = det([P1-P2;P3-P1]);
    t = s*det([P3-P;P2-P3])>=0 & s*det([P1-P;P3-P1])>=0 & s*det([P2-P;P1-P2])>=0;
    
    binary = t;
end

