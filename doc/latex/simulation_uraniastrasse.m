function [tl, map, map_size] = simulation_uraniastrasse( v_max, free_road, modus )
%Datenstruktur der Simulation initialisieren

%traffic_light
%traffic_light ist eine 2xN Matrix für N Lichtsignale. %0=red, 1=green
tl = [   1, 26, 56;
          0,  0,  0];

%Map generieren
%Parameter
map_size = 87;
%free_road = 255; %value for empty street
car_count = 15; %initial car count
%v_max = 5; %maximal speed in the model
%rho = 0.3; % hang_behind Parameter


%Werte aus Google-Maps passend zur map_size 87
%Uraniastrasse Werte in m/Position
%A5 Position: 0/1
%A4 Position 210/26
%A6 Position: 420/56


map = ones(modus,map_size)*free_road;

%Optional: place cars on the street
for street = 1:modus
    for i = 1:car_count
        while (1)
            position=floor(rand*(map_size));
            if ( position ~= 0 && map(street,position) == free_road )
                map(street,position)=round(rand*v_max);
                break
            end
        end
    end
end

if (modus==2)
    map = [map,[car_count;car_count]];
else
    map = [map,car_count];
end