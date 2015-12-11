function [West_direction, East_direction] = test_2(x_w, x_o, modus)

%clear Workspace
%    clear
%    x_w = 1000;
%    x_o = 1000;
% % 
% % % % %modus = [w_modus, e_modus];
%    modus = [2,1];

%globale Parameter
steps = 1470; %Number of timesteps in the simulation
free_road = 255; %value for empty street
v_max = 5; %maximal speed in the model
rho = 0.3; % hang_behind Parameter

output_w_h = 600;
output_o_h = 600;

w_modus = modus(1);
e_modus = modus(2);


%Datenstruktur der Simulation initialisieren
%Richtung Osten
[traffic_light_o, M_o, map_size_o] = simulation_sihlstrasse_one_line( v_max, free_road, e_modus );
trafficlight_t_o=15;
redlight_t_o=4;
 
%Richtung Westen
[traffic_light_w, M_w, map_size_w] = simulation_uraniastrasse( v_max, free_road, w_modus );
trafficlight_t_w=15;
redlight_t_w=4;

%change_traffic_light
%function to change the above traffic lights
%input step=i
%tbd... sollte eine Funktion zuweisen
%change_traffic_light = change_traffic_light_test(traffic_light, i);

%Data structure for simulation steps M_o and M_w
% two rows represents a timestep (one map update)
% the first (map_size)-colums represents the street, the last two stands
% for the car_counter on the two streets
%same for west direction


%T Debuggingdatenstruktur
%T enthält den Zustand der einzelnen traffic_lights in der row-i zum Zeitschritt i
T_o = [];
T_w = [];

%east direction
%Anzahl Autos in der Warteschlange
Warteschlange_Sihlstrasse = 0;
Warteschlange_Annagasse = 0;
Warteschlange_out_Bahnhofquai = 0;
%Anzahl der generierten Autos
Input_Count_Sihlstrasse = 0;
Input_Count_Annagasse = 0;
%Anzahl gelöschter Autos
Output_Count_Bahnhofquai = 0;

%west direction
%Anzahl Autos in der Warteschlange
Warteschlange_Bahnhofquai = 0;
Warteschlange_out_Sihlstrasse = 0;
%Anzahl der generierten Autos
Input_Count_Bahnhofquai = 0;
%Anzahl gelöschter Autos
Output_Count_Sihlstrasse = 0;


%run the simulation for east direction
for i = 1:steps
%% west direction
    %Update the Map
    New_Map = map_update(w_modus, M_w(end-(w_modus-1):end,:), map_size_w, free_road, v_max, rho, traffic_light_w);
    %Zufluss zum System zu steuern
    [New_Map, Warteschlange_Bahnhofquai, Input_Count_Bahnhofquai] = add_cars(w_modus, New_Map, i, Warteschlange_Bahnhofquai, Input_Count_Bahnhofquai, free_road, x_w, steps);
    %[New_Map, Warteschlange_Bahnhofquai, Input_Count_Bahnhofquai] = input_bahnhofquai(New_Map, i, Warteschlange_Bahnhofquai, Input_Count_Bahnhofquai, free_road);
    %Abflüsse
    [New_Map, Warteschlange_out_Sihlstrasse, Output_Count_Sihlstrasse] = delete_cars(w_modus, New_Map, i, Warteschlange_out_Sihlstrasse, Output_Count_Sihlstrasse, free_road, output_w_h, steps );
    %count all cars on the street
    car_counter_w = [0;0];
    for street = 1:w_modus
        for k = New_Map(street,:)
            if ( k ~= free_road )
                car_counter_w(street) = 1 + car_counter_w(street);
            end
        end
    end
    %fügt aktuellen car_counter der Datenstruktur hinzu
    if ( w_modus == 1 ), car_counter_w = car_counter_w(1); end;
    New_Map = [New_Map, car_counter_w];
    %fügt aktuelle Map der Datenstruktur M hinzu
    M_w = [M_w;New_Map];
    %Debugin Plot: jeden Step grafisch anzeigen
     M_plot = New_Map;
     visualization_test( M_plot );
    %Debuggingdatenstruktur mit aktuellem Zustand der traffic_lights füllen
    T_w = [T_w; traffic_light_w(2,:)];
    
%% east direction
    %Update the Map
    New_Map = map_update(e_modus, M_o(end-(e_modus-1):end,:), map_size_o, free_road, v_max, rho, traffic_light_o);
   
    %Zufluss zum System zu steuern
    [New_Map, Warteschlange_Sihlstrasse, Input_Count_Sihlstrasse] = add_cars(e_modus, New_Map, i, Warteschlange_Sihlstrasse, Input_Count_Sihlstrasse, free_road, x_o, steps);
    %[New_Map, Warteschlange_Annagasse, Input_Count_Annagasse] = input_annagasse(New_Map, i, Warteschlange_Annagasse, Input_Count_Annagasse, free_road);
    
    %Abflüsse
    [New_Map, Warteschlange_out_Bahnhofquai, Output_Count_Bahnhofquai] = delete_cars(e_modus, New_Map, i, Warteschlange_out_Bahnhofquai, Output_Count_Bahnhofquai, free_road, output_o_h, steps );
    
    %Debuging etc
    %count all cars on the street
    car_counter_o = [0;0];
    for street = 1:e_modus
        for k = New_Map(street,:)
            if ( k ~= free_road )
                car_counter_o(street) = 1 + car_counter_o(street);
            end
        end
    end
    %fügt aktuellen car_counter der Datenstruktur hinzu
    if ( e_modus == 1 ), car_counter_o = car_counter_o(1); end;
    New_Map = [New_Map, car_counter_o];
    %fügt aktuelle Map der Datenstruktur M hinzu
    M_o = [M_o;New_Map];
    %Debugin Plot: jeden Step grafisch anzeigen
    % M_plot = New_Map;
    % visualization_test( M_plot );
    %Debuggingdatenstruktur mit aktuellem Zustand der traffic_lights füllen
    T_o = [T_o; traffic_light_o(2,:)];
    

    
    %change traffic_lights for next timestep
    traffic_light_w = change_traffic_light_uraniastrasse(traffic_light_w, i, redlight_t_w, trafficlight_t_w);
    traffic_light_o = change_traffic_light_sihlstrasse( traffic_light_o, i, redlight_t_o, trafficlight_t_o);
end

%% Ausgabe erstellen
%Matrix bearbeiten
%Feld 1 und car_counter entfernen
%M_plot = Map(:,1:(end-1))
M_w = M_w(:,2:(end-1));
M_o = M_o(:,2:(end-1));


subplot(2,1,1)
rgb_Matrix_w = visualization_test( fliplr(M_w) );
title('New status west-direction: Bahnhofquai->Sihlstrasse')
 
subplot(2,1,2)
rgb_Matrix_o = visualization_test( M_o );
title('New status east-direction One-Lane: Sihlstrasse->Bahnhofquai')

hold off


%%Output Daten
% Input_Count == x (2*15 Autos die am Anfang generiert werden, werden nicht
% mitgezählt
West_direction = [Input_Count_Bahnhofquai, Warteschlange_Bahnhofquai, Output_Count_Sihlstrasse, car_counter_w'];

%Habe den Input Annagasse momentan gestrichen... den können wir am Freitag
%wieder aktivieren
Input_Total = Input_Count_Sihlstrasse + Input_Count_Annagasse;
Warteschlange_Total = Warteschlange_Sihlstrasse + Warteschlange_Annagasse;

East_direction = [Input_Total, Warteschlange_Total, Output_Count_Bahnhofquai, car_counter_o'];


end




    