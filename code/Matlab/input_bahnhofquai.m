function [New_Map, Warteschlange_Bahnhofquai, Input_Count_Bahnhofquai]  = input_bahnhofquai(New_Map, i, Warteschlange_Bahnhofquai, Input_Count_Bahnhofquai, free_road)
%fügt alle 3 Zeitschritte 2 Autos hinzu

if ( mod(i,3) == 0 || mod(i,7) == 0 )
    Warteschlange_Bahnhofquai = Warteschlange_Bahnhofquai + 2;
    Input_Count_Bahnhofquai = Input_Count_Bahnhofquai + 2;
end

for street = 1:2
    if ( Warteschlange_Bahnhofquai ~= 0 && New_Map(street,1) == free_road )
        New_Map(street,1) = 0;
        Warteschlange_Bahnhofquai = Warteschlange_Bahnhofquai - 1;
    end
end


end

