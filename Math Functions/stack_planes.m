function [stacked_planes] = stack_planes(projected_points,num)
%   This function will stack the planes from east-to-west (num = 1) or
%   west-to-east (num = -1) depending the suns position

    % Sort the code in ascending order
    sorted_proj_points = sortrows(projected_points, 1); % sorted list be x values
    [M, I] = max(sorted_proj_point(1:end, 3);   % find index of max z value
    
    if num == 1         % Sun on east side
        non_shaded_points = sorted_proj_points(I:end, 1:end);
    elseif num == -1    % Sun on west side
        non_shaded_points = sorted_proj_points(1:I, 1:end);
    end
    
    % stacked_planes now contains the plane of all points hit by the sun in
    % y-z frame, as x is not needed (stacked east-west points)
    stacked_planes = non_shaded_points(:, [2, 3]);
end

