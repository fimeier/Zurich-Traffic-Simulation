function v = slow_down(Map, map_size, free_road, traffic_light, v_n, position)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% Distance to next car == d_n
d_n = 0;
for k = position+1:map_size
    if( Map(k) == free_road )
        d_n = 1 + d_n;
    else
        break
    end
end

% ineffizient... kann oben mit d_n kombiniert werden
% lasse es aber momentan hier, da möglicherweise next_car und
% next_traffic-light bekannt sein müssen
% Distance to next traffic_light = s_n
% Lichtsignale von hinten nach vorne durchgehen

traffic_light_number = 0;
s_n = 1000;

%            t = 1,2,3,4
%     traffic_light = [   20, 40, 60, 80 ;
%                         0,  1,  0,  1   ]

for t = 1:length(traffic_light)
    if ( position <= traffic_light(1,t) )
        traffic_light_number = t;
        break
    end
end

% trifft zu, wenn Auto nach dem letzten Traffic Light ist
% dann "unendlich weit"==1000 fahren
if ( traffic_light_number == 0 )
    s_n = 1000;
else
    position_traffic_light = traffic_light(1,traffic_light_number);
    status_traffic_light = traffic_light(2,traffic_light_number);
    %wenn ==1, dann grün
    if ( status_traffic_light == 1 )
        s_n = 1000;
    %nächstes Lichtsignal ist rot
    else
        s_n = position_traffic_light - position;
    end
end
    
   

v=min([v_n,d_n,s_n]);

end

