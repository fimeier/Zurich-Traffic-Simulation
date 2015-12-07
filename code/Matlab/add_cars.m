function [New_Map, Warteschlange, Input_Count]  = add_cars(New_Map, i, Warteschlange, Input_Count, free_road, x, steps)
%fügt x-viele Autos in steps-vielen Schritten hinzu

%Soll-Wert der generierten Autos im Schritt i
y_i = i ./ steps * x;
differenz = floor( y_i - Input_Count );
if ( differenz > 0 )
    Input_Count = Input_Count + differenz;
    Warteschlange = Warteschlange + differenz;
end  


%p street 1: 1/2
%p street 2: 1/2
t=rand;
%strasse 2 dann 1
abc = 2:-1:1;
if ( t < 0.5 )
    %strasse 1 dann 2
    abc = 1:2;
end

for street = abc
    if ( Warteschlange ~= 0 && New_Map(street,1) == free_road )
        New_Map(street,1) = 0;
        Warteschlange = Warteschlange - 1;
    end
end


end

