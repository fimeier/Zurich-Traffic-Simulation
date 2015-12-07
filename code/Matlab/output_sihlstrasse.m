function [New_Map, Output_Count_Sihlstrasse] = output_sihlstrasse(New_Map, Output_Count_Sihlstrasse, i, free_road)

%1300 per / 1470 times steps

if ( mod(i,2) == 0 )
    if ( New_Map(1,end) ~= free_road )
        Output_Count_Sihlstrasse = Output_Count_Sihlstrasse + 1;
        New_Map(1,end) = free_road;
    end
    if ( New_Map(2,end) ~= free_road )
        Output_Count_Sihlstrasse = Output_Count_Sihlstrasse + 1;
        New_Map(2,end) = free_road;
    end
end

end

