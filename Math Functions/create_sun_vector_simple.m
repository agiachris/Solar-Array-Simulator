function [vector] = create_sun_vector_simple(azimuth,elevation)
%   This function computes a vector describing the direction and magnitude
%   of sun rays hitting the solar array by converting the azimuth and
%   elevation of the sun from spherical coordanites to cartesian
%   coordanites, and scaling the vector to the presummed solar irradiance

    x = sin(azimuth);
    y = cos(azimuth);
    z = sin(elevation);
    v = [x y z];
    mag = sqrt(sum(v.^2));
    vector = 1000/mag*v;
end

