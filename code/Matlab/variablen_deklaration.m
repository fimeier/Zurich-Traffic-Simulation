%globale Parameter
steps = 1470; %Number of timesteps in the simulation
free_road = 255; %value for empty street
v_max = 5; %maximal speed in the model
rho = 0.3; % hang_behind Parameter

%Datenstruktur einer Simulation
%east direction
traffic_light       %traffic_light ist eine 2xN Matrix für N Lichtsignale. %0=red, 1=green
Map_o               % Map_o is the map for the east direction, a 2-X-map_size matrix (2 STREETS)  = ones(2,map_size)*free_road;
                    % "Street 1" is the upper street
                    % "street 2" .... (look at input_annagasse.m)
map_size_o          %size
car_count_o         %0 or initial amount of cars on each street
%same for west direction
traffic_light       %
Map_w               %
map_size_w          %
car_count_w         %


%Data structure for simulation steps
% two rows represents a timestep (one map update)
% the first (map_size)-colums represents the street, the last two stands
% for the car_counter on the two streets
M_o = [Map_o,[car_count_o;car_count_o]];
%same for west direction
M_w = [Map_w,[car_count_w;car_count_w]];

%T Debuggingdatenstruktur
%T enthält den Zustand der einzelnen traffic_lights in der row-i zum Zeitschritt i
T_o = [];


%east direction
%Anzahl Autos in der Warteschlange
Warteschlange_Sihlstrasse = 0;
Warteschlange_Annagasse = 0;
%Anzahl der generierten Autos
Input_Count_Sihlstrasse = 0;
Input_Count_Annagasse = 0;

%west direction
%Anzahl Autos in der Warteschlange
Warteschlange_Bahnhofquai = 0;
%Anzahl der generierten Autos
Input_Count_Bahnhofquai = 0;


%data structure for "each step"
New_Map         %contains the two streets in one direction after the map update
....







