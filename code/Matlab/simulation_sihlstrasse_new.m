function [tl, map, map_size, car_count ] = simulation_sihlstrasse_new( v_max, free_road )
%Datenstruktur der Simulation initialisieren

%traffic_light
%traffic_light ist eine 2xN Matrix für N Lichtsignale. %0=red, 1=green
tl = [   1, 9, 46, 59;
          0,  0,  0, 0 ];

%Map generieren
%Parameter
map_size = 85;
%free_road = 255; %value for empty street
car_count = 30; %initial car count
%v_max = 5; %maximal speed in the model
%rho = 0.3; % hang_behind Parameter


%Werte aus Google-Maps passend zur map_size 85
%Sihlstrasse Werte in m/Position
%A1 Position: 0/1
%A2 Position 71/9
%St. Annagasse: 173/23
%Abzweigung: 248/33
%A3  Position 344/46
%A4 Position: 440/59
%A5 Position: 636/85


map = ones(2,map_size)*free_road;

%Optional: place cars on the street
for street = 1:1
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