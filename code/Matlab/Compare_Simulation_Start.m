%% Max Throughput Street
%Result: 800 amd 400
IBQ = [500:100:1300];
output_w_h = 6000;
ISS = [500:100:1300];
output_o_h = 6000;




n = length(IBQ);



%x_modus == place cars on 1 or 2 lanes
e_modus = 1;
w_modus = 2;
modus = [w_modus, e_modus];

 
WD = [];
ED = [];
for i = 1:n
    i
    [West_direction, East_direction] = Compare_Situation_Simulation(IBQ(i), output_w_h, ISS(i), output_o_h, modus);
    %           Input_Count,        Warteschlange
    WD = [WD; West_direction];
    ED = [ED; East_direction]; 
end

figure

subplot(2,1,1)
hold on
plot( IBQ, WD(:,2)','--','linewidth',2 );
plot( IBQ, WD(:,3)','--','linewidth',2 );
legend('Traffic jam', 'Throughput');

title('Old status east-direction: Sihlstrasse->Bahnhofquai')
xlabel('Input: cars per hour')
ylabel('Traffic jam ahead traffic light')
hold off
 
subplot(2,1,2)
hold on
plot( IBQ, ED(:,2)','--','linewidth',2 );
plot( IBQ, ED(:,3)','--','linewidth',2 );
legend('Traffic jam', 'Throughput'); 

title('New status east-direction: Sihlstrasse->Bahnhofquai')
xlabel('Input: cars per hour')
ylabel('Traffic jam ahead traffic light')

hold off









        
