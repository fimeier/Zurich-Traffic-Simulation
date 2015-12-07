function [New_Map, Warteschlange_Annagasse, Input_Count_Annagasse]  = input_annagasse(New_Map, i, Warteschlange_Annagasse, Input_Count_Annagasse, free_road)
%fügt alle 5 Zeitschritte 1 Auto hinzu

if ( mod(i,7) == 0 )
    Warteschlange_Annagasse = Warteschlange_Annagasse + 1;
    Input_Count_Annagasse = Input_Count_Annagasse + 1;
end

%p street 1: 2/5
%p street 2: 3/5
t=rand;
if ( t < 2. /5. )
    %strasse 1 dann 2
    abc = 1:2;
else
    %strasse 2 dann 1
    abc = 2:-1:1;
end

for street = abc
    if ( Warteschlange_Annagasse ~= 0 && New_Map(street,24) == free_road )
        New_Map(street,24) = 0;
        Warteschlange_Annagasse = Warteschlange_Annagasse - 1;
    end
end


end

