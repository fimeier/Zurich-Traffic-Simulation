function traffic_light = change_traffic_light( traffic_light, step )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%rot alle 0,1
%grün alle 2,3,4
mod_step = mod(step,5);
for t_l = 1:length(traffic_light)
    if ( mod_step == 0 || mod_step == 1 )
        traffic_light(2,:) = 0;
    else
        traffic_light(2,:) = 1;
    end
end
end

