function [New_Map, Warteschlange_Sihlstrasse, Input_Count_Sihlstrasse]  = input_sihlstrasse(New_Map, i, Warteschlange_Sihlstrasse, Input_Count_Sihlstrasse, free_road)
%fügt alle 3 Zeitschritte 2 Autos hinzu

if ( mod(i,3) == 0 )
    Warteschlange_Sihlstrasse = Warteschlange_Sihlstrasse + 2;
    Input_Count_Sihlstrasse = Input_Count_Sihlstrasse + 2;
end

for street = 1:2
    if ( Warteschlange_Sihlstrasse ~= 0 && New_Map(street,1) == free_road )
        New_Map(street,1) = 0;
        Warteschlange_Sihlstrasse = Warteschlange_Sihlstrasse - 1;
    end
end


end

