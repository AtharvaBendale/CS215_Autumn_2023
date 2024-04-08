plot(x, y, 'g')
hold on
plot(x, z30, 'y')
plot(x, y_avg30, 'r')
plot(x, y_median30, 'ob')
plot(x, y_quar30, 'black')
title('Graphs for f=30%')
legend('y', 'Corrupted y : z', 'Moving average filtered', 'Moving median filtered', 'Moving quartile filtered')
hold off