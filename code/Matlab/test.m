%function M_plot = test()
%Map generieren
%%Datenstruktur
%Map[i]=v, wobei v Geschwindigkeit Auto, falls v != free_road


map_size = 100;
free_road = 66;
v_max = 5;
rho = 0.5;

%0=red, 1=green
traffic_light = [   40, 80, 120, 160;
                    1,  1,  1, 1 ];

car_count = 15;
steps = 30;

%Map generieren
Map = create_map_and_cars(map_size, free_road, car_count, v_max);


T = traffic_light;
%T = [T; traffic_light(2,:)];
M = [Map,car_count];
for i = 1:steps
    New_Map = map_update(M(end,:), map_size, free_road, v_max, rho, traffic_light);
    New_Map = add_one_car(New_Map, free_road);
    car_counter = 0;
    for k = New_Map
        if ( k ~= free_road )
            car_counter = 1 + car_counter;
        end
    end
    New_Map = [New_Map, car_counter];
    
    M = [M;New_Map];
    
     M_plot = New_Map;
     Street( M_plot );

    
    traffic_light = change_traffic_light(traffic_light, i);
    T = [T; traffic_light(2,:)];
end

M_plot = M(:,1:(end-1));

Street( M_plot );

%end


    