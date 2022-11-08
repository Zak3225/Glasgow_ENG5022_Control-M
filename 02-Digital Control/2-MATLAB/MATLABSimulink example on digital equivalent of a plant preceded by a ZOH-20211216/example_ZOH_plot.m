figure;
plot(u.time,u.Data, ud.time,ud.Data,'.','MarkerSize',12);
title('Discrete equivalent preceded by ZOH: output');
legend('Continuous plant preceded by ZOH', 'Discrete equivalent')