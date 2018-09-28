% Main Script for Solar Array Simulation

% obtaining v and f from stl file
fileName = PATH_TO_FILE;                % INPUT PATH TO STL FIlE
[v,f,n,name] = stlread2(fileName);
vertices = order_vertices(v, f);        % Ordered Vertices
N = size(vertices, 1);

secs = 9*3600;                          % number of seconds from 8am-5pm
projected_vertices = zeros([N,3]);      % to hold projected points

inst_energy = zeros(secs);              % instantaneous energy generated
tot_energy = 0;                         % sum of instantaneous energy/s = tot

for i = 1:secs
    [Az,E1] = SolarAzEl(i+8*3600, Lat, Lon, Alt); 
    sun_vec = create_sun_vector_simple(Az, El);
    % Obtain rotated vertices, rotated sun_vector, and num (indicating if
    % sun is rotated to east or west side, Az = 90, Az = 180 respectively.
    [rot_vert, rot_sun_vec, num] = rotate_all_z_axis(vertices, sun_vec); 
    for j = 1:N/3
        k = j*3;
        triangle = rot_vert(k-2:k, 1:end);  % triangle made from rotated points k-2 to k
        % Project triangle onto rotated sun vector
        projected_points(k-2:k, 1:end) = project_onto_sun_vector(triangle, rot_sun_vec);
    end
    k = 0;
    % num = 1 indicates sun rotated to east, num = -1 indicates sun rotates
    % west. Matters for the order of stacking points on projected planes
    stacked_planes = stack_planes(projected_points, num); 
    area = return_areas(stacked_planes);    % get area of all non-shaded n-sided polygon
    
    inst_energy(i) = area*1000*1000*1000;      % 1000W/M^2 * mm^2 -> 1000*1000*1000*area(mm) = W
    tot_energy = tot_energy + inst_energy(i);      % summed to take an average 
    disp(inst_energy(i))
end

disp(tot_energy)                                % total energy generated over race