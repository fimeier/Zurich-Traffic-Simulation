function Map = create_map_and_cars( map_size, free_road, car_count, v_max )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
Map = ones(1,map_size)*free_road;
for i = 1:car_count
    while (1)
        position=floor(rand*(map_size));
        if ( position ~= 0 && Map(position) == free_road )
            Map(position)=round(rand*v_max);
            break
        end
    end
end

end

