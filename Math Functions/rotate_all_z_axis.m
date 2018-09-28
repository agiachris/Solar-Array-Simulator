function [rotated_vertices, rotated_sun_vec, num] = rotate_all_z_axis(vertices, sun_vec, azimuth)
%   This function rotates all vertices and sun vector to the coordanite
%   system where the y-component of the sun vector is equal to zero. This
%   allows the planar projection of various car frames to be computed in a
%   way that they can be stacked.
    if azimuth>0 && azimuth<90
        theta = 90-azimuth;
        num = 1;
    elseif azimuth>90 && azimuth<270
        theta = 270 - azimuth;
        num = -1;
    elseif azimuth > 270
        theta = 450 - azimuth;
        num = 1;
    end
    
    rotation_matrix = [cos(theta), sin(theta), 0; -sin(theta), cos(theta), 0; 0,0,1];
    rotated_sun_vec = transpose(rotation_matrix*transpose(sun_vec));
    
    N = size(vertices,1);
    rotated_vertices = zeros(N, 3);
    for j = 1:N
        rotated_vertices(j, 1:end) = transpose(rotation_matrix*transpose(vertices(j, 1:end)));
    end
end

