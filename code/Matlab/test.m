function [West_direction, East_direction] = test(x_w, x_o)

%clear Workspace
%clear
%x_w = 1200;
%x_o = 1200;

%globale Parameter
steps = 1470; %Number of timesteps in the simulation
free_road = 255; %value for empty street
v_max = 5; %maximal speed in the model
rho = 0.3; % hang_behind Parameter

%Datenstruktur der Simulation initialisieren
%Richtung Osten
[traffic_light_o, Map_o, map_size_o, car_count_o] = simulation_sihlstrasse( v_max, free_road );
 
%Richtung Westen
[traffic_light_w, Map_w, map_size_w, car_count_w] = simulation_uraniastrasse( v_max, free_road );


%change_traffic_light
%function to change the above traffic lights
%input step=i
%tbd... sollte eine Funktion zuweisen
%change_traffic_light = change_traffic_light_test(traffic_light, i);

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
T_w = [];

%east direction
%Anzahl Autos in der Warteschlange
Warteschlange_Sihlstrasse = 0;
Warteschlange_Annagasse = 0;
%Anzahl der generierten Autos
Input_Count_Sihlstrasse = 0;
Input_Count_Annagasse = 0;
%Anzahl gelöschter Autos
Output_Count_Bahnhofquai = 0;

%west direction
%Anzahl Autos in der Warteschlange
Warteschlange_Bahnhofquai = 0;
%Anzahl der generierten Autos
Input_Count_Bahnhofquai = 0;
%Anzahl gelöschter Autos
Output_Count_Sihlstrasse = 0;


%run the simulation for east direction
for i = 1:steps
%% west direction
    %Update the Map
    New_Map = map_update(M_w(end-1:end,:), map_size_w, free_road, v_max, rho, traffic_light_w);
    %Zufluss zum System zu steuern
    [New_Map, Warteschlange_Bahnhofquai, Input_Count_Bahnhofquai] = add_cars(New_Map, i, Warteschlange_Bahnhofquai, Input_Count_Bahnhofquai, free_road, x_w, steps);
    %[New_Map, Warteschlange_Bahnhofquai, Input_Count_Bahnhofquai] = input_bahnhofquai(New_Map, i, Warteschlange_Bahnhofquai, Input_Count_Bahnhofquai, free_road);
    %Abflüsse
    [New_Map, Output_Count_Sihlstrasse] = output_sihlstrasse(New_Map, Output_Count_Sihlstrasse, i, free_road);
    %count all cars on the street
    car_counter_w = [0;0];
    for street = 1:2
        for k = New_Map(street,:)
            if ( k ~= free_road )
                car_counter_w(street) = 1 + car_counter_w(street);
            end
        end
    end
    %fügt aktuellen car_counter der Datenstruktur hinzu
    New_Map = [New_Map, car_counter_w];
    %fügt aktuelle Map der Datenstruktur M hinzu
    M_w = [M_w;New_Map];
    %Debugin Plot: jeden Step grafisch anzeigen
     %M_plot = New_Map;
     %visualization_test( M_plot );
    %Debuggingdatenstruktur mit aktuellem Zustand der traffic_lights füllen
    T_w = [T_w; traffic_light_w(2,:)];
    
%% east direction
    %Update the Map
    New_Map = map_update(M_o(end-1:end,:), map_size_o, free_road, v_max, rho, traffic_light_o);
   
    %Zufluss zum System zu steuern
    [New_Map, Warteschlange_Sihlstrasse, Input_Count_Sihlstrasse] = add_cars(New_Map, i, Warteschlange_Sihlstrasse, Input_Count_Sihlstrasse, free_road, x_o, steps);
    %[New_Map, Warteschlange_Annagasse, Input_Count_Annagasse] = input_annagasse(New_Map, i, Warteschlange_Annagasse, Input_Count_Annagasse, free_road);
    
    %Abflüsse
    [New_Map, Output_Count_Bahnhofquai] = output_bahnhofquai(New_Map, Output_Count_Bahnhofquai, i, free_road);
    
    %Debuging etc
    %count all cars on the street
    car_counter_o = [0;0];
    for street = 1:2
        for k = New_Map(street,:)
            if ( k ~= free_road )
                car_counter_o(street) = 1 + car_counter_o(street);
            end
        end
    end
    %fügt aktuellen car_counter der Datenstruktur hinzu
    New_Map = [New_Map, car_counter_o];
    %fügt aktuelle Map der Datenstruktur M hinzu
    M_o = [M_o;New_Map];
    %Debugin Plot: jeden Step grafisch anzeigen
     %M_plot = New_Map;
     %visualization_test( M_plot );
    %Debuggingdatenstruktur mit aktuellem Zustand der traffic_lights füllen
    T_o = [T_o; traffic_light_o(2,:)];
    
    
    %change traffic_lights for next timestep
    traffic_light_w = change_traffic_light_uraniastrasse(traffic_light_w, i);
    traffic_light_o = change_traffic_light_sihlstrasse(traffic_light_o, i);
end

%% Ausgabe erstellen
%Matrix bearbeiten
%car_counter entfernen
%M_plot = Map(:,1:(end-1))
M_w = M_w(:,1:(end-1));
M_o = M_o(:,1:(end-1));


subplot(2,1,1)
rgb_Matrix_w = visualization_test( fliplr(M_w) );
title('Current status west-direction: Bahnhofquai->Sihlstrasse')
 
subplot(2,1,2)
rgb_Matrix_o = visualization_test( M_o );
title('Current status east-direction: Sihlstrasse->Bahnhofquai')

hold off


%%Output Daten
% Input_Count == x (2*15 Autos die am Anfang generiert werden, werden nicht
% mitgezählt
West_direction = [Input_Count_Bahnhofquai, Warteschlange_Bahnhofquai, Output_Count_Sihlstrasse, car_counter_w(1,1), car_counter_w(2,1)];

%Habe den Input Annagasse momentan gestrichen... den können wir am Freitag
%wieder aktivieren
Input_Total = Input_Count_Sihlstrasse + Input_Count_Annagasse;
Warteschlange_Total = Warteschlange_Sihlstrasse + Warteschlange_Annagasse;

East_direction = [Input_Total, Warteschlange_Total, Output_Count_Bahnhofquai, car_counter_o(1,1), car_counter_o(2,1)];


end




    