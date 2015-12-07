function New_Map = map_update( Map, map_size, free_road, v_max, rho, traffic_light )

%create return datastructure
New_Map = ones(2,map_size)*free_road;

for street = 1:2
    for i= 1:map_size
        %for each field that contains a car, do..
        if ( Map(street,i)~= free_road )

            %get car speed
            v_n = Map(street,i);

            %call the acceleration function
            %increases the speed
            v_n = acceleration(v_n,v_max);

            %call the slow_down function function
            v_n = slow_down(Map(street,:), map_size, free_road, traffic_light, v_n, i);

            v_n = hang_behind(v_n, rho);

            %callculate the position on the map, depending on the new speed
            position = i + v_n;
            %write the new speed into the callculated position
            New_Map(street, position) = v_n;
        end
    end
end

end

