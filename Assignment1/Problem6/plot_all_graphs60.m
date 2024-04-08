plot(x, y, 'g')
hold on
plot(x, z60, 'y')
plot(x, y_avg60, 'r')
plot(x, y_median60, 'ob')
plot(x, y_quar60, 'black')
title('Graphs for f=60%')
legend('y', 'Corrupted y : z', 'Moving average filtered', 'Moving median filtered', 'Moving quartile filtered')
hold off