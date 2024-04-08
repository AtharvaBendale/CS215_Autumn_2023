QMI = [];
for t=-10:10
    run("./joint_hist.m")
end
plot(-t:1:t, QMI, 'o-');
xlabel("t_x");
ylabel("QMI");
clear t;