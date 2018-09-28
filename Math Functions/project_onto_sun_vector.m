function [points] = project_onto_sun_vector(vertices, sun_vector)
%   This function picks one vertex and assumes it is a point on the plane
%   described by the sun_vector. Next, each of the other points are
%   projected onto this plane to form a planar polygon
    
    mag = sqrt(sum(sun_vector.^2));
    vnorm = 1/mag*sun_vector;
    s = size(vertices);
    N = s(1);
    P0 = vertices(1, 1:end);            % Assume on the plane of sun_vector
    
    for i = 1:N-1
        PiP0 = vertices(i+1, 1:end) - P0;
        proj_vec = vnorm.*((dot(PiP0, vnorm))/(sum(vnorm.^2)));
        proj_point = vertices(i+1, 1:end) - proj_vec;
        vertices(i+1, 1:end) = proj_point;
    end
    
    points = vertices;                  % Projected points in vertices
end

