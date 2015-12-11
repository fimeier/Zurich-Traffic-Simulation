function [New_Map, Warteschlange, Input_Count]  = add_cars(modus, New_Map, i, Warteschlange, Input_Count, free_road, x, steps)
%adds x-many cars in steps (==time steps)

%Soll-Wert der generierten Autos im Schritt i
y_i = i ./ steps * x;
differenz = floor( y_i - Input_Count );
if ( differenz > 0 )
    Input_Count = Input_Count + differenz;
    Warteschlange = Warteschlange + differenz;
end  

abc = 1;
if ( modus == 2)
    %p street 1: 1/2
    %p street 2: 1/2
    t=rand;
    %strasse 2 dann 1
    abc = 2:-1:1;
    if ( t < 0.5 )
        %strasse 1 dann 2
        abc = 1:2;
    end
end

for street = abc
    if ( Warteschlange ~= 0 && New_Map(street,1) == free_road )
        New_Map(street,1) = 1;
        Warteschlange = Warteschlange - 1;
    end
end


end

