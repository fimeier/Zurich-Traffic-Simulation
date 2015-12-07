

%Input Bahnhofquai, Werte gemäss Zählstelle und Extrem Wert
IBQ = [500:100:1500];%[154,116,91,71,84,184,483,745,817,782,762,773,729,754,804,807,855,892,852,653,484,398,388,313,1300];
%Input Sihlstrasse, Werte gemäss Zählstelle
ISS = [500:100:1500];%[115,74,52,46,51,128,508,719,698,656,691,706,607,652,704,732,746,751,729,559,397,335,325,247,1200];

n = length(IBQ);


 

%simulation mit der nötigen Anzahl Autos starten
%West_direction = [Input_Count_Bahnhofquai, Warteschlange_Bahnhofquai, Output_Count_Sihlstrasse, car_counter_w(1,1), car_counter_w(2,1)];
%East_direction = [Input_Total, Warteschlange_Total, Output_Count_Bahnhofquai, car_counter_o(1,1), car_counter_o(2,1)];
WD = [];
ED = [];
for i = 1:n
    [West_direction, East_direction] = test(IBQ(i), ISS(i));
    %           Input_Count,        Warteschlange
    WD = [WD; West_direction(1), West_direction(2)];
    ED = [ED; East_direction(1), East_direction(2)];
    
end


plot( IBQ, WD(:,2)' );
plot( ISS, ED(:,2)' ); 








        
