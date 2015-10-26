function New_Map = map_update( Map, map_size, free_road, v_max, rho, traffic_light )

% Map = Map_;
% map_size = map_size_;
% free_road = free_road_;
% v_max = v_max_;
% rho = rho_;

New_Map = ones(1,map_size)*free_road;


for i= 1:map_size
    if ( Map(i)~= free_road )
        v_n = Map(i);
        v_n = acceleration(v_n,v_max);
        
        v_n = slow_down(Map, map_size, free_road, traffic_light, v_n, i);

        v_n = hang_behind(v_n, rho);
        
        position = i + v_n;
        New_Map(position) = v_n;
        
    end
end









end

