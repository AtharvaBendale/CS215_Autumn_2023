y = normrnd(0, 4, 1000);
indices = randperm(1000);
T = y(indices(1:750));
V = y(indices(751:end));
sigma = [0.001, 0.1, 0.2, 0.9, 1, 2, 3, 5, 10, 20, 100];
log_sigma = log(sigma);
LL = zeros(length(sigma), 1);

% Calculation of LL
for i = 1:length(sigma)
    s = sigma(i);
    for j = 1:length(V)
        LL(i) = LL(i) + log(EstimatedPDF(V(j), T, s));
    end
end

% Figure 1: LL vs log(sigma)
figure;
plot(log_sigma, LL, 'o');
xlabel('$\log(\sigma)$', 'Interpreter', 'latex');
ylabel('Log of joint likelihood of samples in V');
title('LL vs $\log(\sigma)$', 'Interpreter', 'latex');
saveas(gcf, 'LL_log(sigma).png');
close(gcf);

[max_LL, max_index] = max(LL);
max_sigma = sigma(max_index);

% Printing the best LL value and its corresponding sigma 
disp(['Maximum value of LL: ' num2str(max_LL)]);
disp(['Corresponding sigma: ' num2str(max_sigma)]);

ylim([-1600, -400]);

x = -8:0.1:8;
p = zeros(length(x), 1);

% calculating the estimated PDF for the above sigma
for i = 1:length(x)
    p(i) = EstimatedPDF(x(i), T, max_sigma);
end

% true pdf
truedensity = normpdf(x, 0, 4);

% Figure 2: Plots of true density and estimated density
figure;
plot(x, p, 'DisplayName', ['Estimated Density for $\sigma$ = ', num2str(max_sigma)]);
hold on;
plot(x, truedensity, 'DisplayName', 'True Density');
hold off;
legend('Location','northwest','Interpreter', 'latex');
xlabel('Value of x');
ylabel('Probability');
title(['Plots of true density and estimated density for $\sigma$= ', num2str(max_sigma)], 'Interpreter', 'latex');
saveas(gcf, 'True_EstimatedPDF.png');
close(gcf);

%calculation of D
D=zeros(length(sigma),1);
for i=1:length(sigma)
    for j=1:length(V)
        D(i)=D(i)+(EstimatedPDF(V(j),T,sigma(i))-normpdf(V(j),0,4))^2;
    end
end

[min_D, min_index] = min(D);
min_sigma = sigma(min_index);
%printing the best D value and its corresponding sigma
disp(['Minimum value of D: ' num2str(min_D)]);
disp(['Corresponding sigma: ' num2str(min_sigma)]);
%printing the D value for the sigma yielding the best value of LL
disp(['Value of D for the sigma corresponding to the best value of LL ',num2str(D(max_index))]);

%Figure 3: Plot of D vs log(sigma)
figure;
plot(log_sigma,D,'r');
xlabel('Value of $\log \sigma$','Interpreter','latex');
ylabel('Value of D');
title('Plot of D vs $\log \sigma$','Interpreter','latex');
saveas(gcf,'D_vs_log(sigma).png');
close(gcf);

p = zeros(length(x), 1);

for i = 1:length(x)
    p(i) = EstimatedPDF(x(i), T, min_sigma);
end


% Figure 4: Plots of true density and estimated density
figure;
plot(x, p, 'DisplayName', ['Estimated Density for $\sigma$ = ', num2str(min_sigma)]);
hold on;
plot(x, truedensity, 'DisplayName', 'True Density');
hold off;
legend('Location','northwest','Interpreter', 'latex');
xlabel('Value of x');
ylabel('Probability');
title(['Plots of true density and estimated density for $\sigma$= ', num2str(min_sigma)], 'Interpreter', 'latex');
saveas(gcf, 'True_EstimatedPDF2.png');
close(gcf);
