

%Input Bahnhofquai, Werte gemäss Zählstelle
IBQ = [500:100:800];%[154,116,91,71,84,184,483,745,817,782,762,773,729,754,804,807,855,892,852,653,484,398,388,313];
%Input Sihlstrasse, Werte gemäss Zählstelle
ISS = [500:100:800];%[115,74,52,46,51,128,508,719,698,656,691,706,607,652,704,732,746,751,729,559,397,335,325,247];

n = length(IBQ);



%x_modus == place cars on 1 or 2 lanes
e_modus = 2;
w_modus = 2;
modus = [w_modus, e_modus];


%simulation mit der nötigen Anzahl Autos starten
%West_direction = [Input_Count_Bahnhofquai, Warteschlange_Bahnhofquai, Output_Count_Sihlstrasse, car_counter_w(1,1), car_counter_w(2,1)];
%East_direction = [Input_Total, Warteschlange_Total, Output_Count_Bahnhofquai, car_counter_o(1,1), car_counter_o(2,1)];
WD = [];
ED = [];
for i = 1:n
   i
    [West_direction, East_direction] = Current_Situation_Simulation(IBQ(i), ISS(i), modus);
    %           Input_Count,        Warteschlange
    WD = [WD; West_direction(1), West_direction(2)];
    ED = [ED; East_direction(1), East_direction(2)];
    
end


results=figure;

subplot(2,1,1)

plot( [0:length(IBQ)-1], WD(:,2)','--','linewidth',2 );
%xlim([0,length(IBQ)-1]);
title('Current status west-direction: Bahnhofquai->Sihlstrasse')
xlabel('time of day')
ylabel('Traffic jam ahead traffic light')
 
subplot(2,1,2)
plot( [0:length(ISS)-1], ED(:,2)','--','linewidth',2); 
%xlim([0,length(ISS)-1]);
title('Current status east-direction: Sihlstrasse->Bahnhofquai')
xlabel('time of day')
ylabel('Traffic jam ahead traffic light')

hold off












        
