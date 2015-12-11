function traffic_light = change_traffic_light_sihlstrasse( traffic_light, step, redlight_t, trafficlight_t )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%rot alle 0,1
%grün alle 2,3,4
mod_step = mod(step,trafficlight_t);
for t_l = 1:length(traffic_light)
    if ( mod_step <= redlight_t )
        traffic_light(2,:) = 0;
    else
        traffic_light(2,:) = 1;
    end
end
end

