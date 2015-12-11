

A = [0     0     0     0     0     0     2    32    86   132   184   226   277   342   381   427   484   533   586];
B = [0     0     0     0     0     0     0     0     0     0     0     0    20    68   121   168   219   272   321];
plot( [100:50:1000]', B',[100:50:1000]',A,'--','linewidth',2);
hold on

title('east-direction: Sihlstrasse->Bahnhofquai')
xlabel('time of day')
ylabel('Traffic jam ahead traffic light')
legend('Two Lanes', 'One Lane');

hold off