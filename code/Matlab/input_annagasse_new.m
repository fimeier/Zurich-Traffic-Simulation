function [New_Map, Warteschlange_Annagasse, Input_Count_Annagasse]  = input_annagasse_new(New_Map, i, Warteschlange_Annagasse, Input_Count_Annagasse, free_road)
%fügt alle 5 Zeitschritte 1 Auto hinzu

if ( mod(i,7) == 0 )
    Warteschlange_Annagasse = Warteschlange_Annagasse + 1;
    Input_Count_Annagasse = Input_Count_Annagasse + 1;
end


for street = [1,1]
    if ( Warteschlange_Annagasse ~= 0 && New_Map(street,24) == free_road )
        New_Map(street,24) = 0;
        Warteschlange_Annagasse = Warteschlange_Annagasse - 1;
    end
end


end

