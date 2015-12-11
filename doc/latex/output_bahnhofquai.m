function [New_Map, Output_Count_Bahnhofquai] = output_bahnhofquai(modus, New_Map, Output_Count_Bahnhofquai, i, free_road)

%790 per / 1470 times steps

if ( mod(i,4) == 0 || mod(i,37) == 0)
    if ( New_Map(1,end) ~= free_road )
        Output_Count_Bahnhofquai = Output_Count_Bahnhofquai + 1;
        New_Map(1,end) = free_road;
    end
    if ( modus==2 && New_Map(2,end) ~= free_road )
        Output_Count_Bahnhofquai = Output_Count_Bahnhofquai + 1;
        New_Map(2,end) = free_road;
    end
end

end

