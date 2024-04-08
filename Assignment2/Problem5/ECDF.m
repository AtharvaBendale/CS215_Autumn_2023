T = 100000;
N_values = [5, 10, 20, 50, 100, 200, 500, 1000, 5000, 10000];
num_bins = 50;
MAD=zeros(10,1);
for n_idx = 1:length(N_values)
    N = N_values(n_idx);
    X = zeros(T,1);
    
    for i = 1:T
        Y = rand(1, N);
        for j = 1:N
            if Y(j) >= 0 && Y( j) <= 0.05
                Y( j) = 1;
            elseif Y(j) > 0.05 && Y( j) <= 0.45
                Y( j) = 2;
            elseif Y( j) > 0.45 && Y( j) <= 0.6
                Y( j) = 3;
            elseif Y(j) > 0.6 && Y( j) <= 0.9
                Y( j) = 4;
            elseif Y( j) > 0.9 && Y(j) <= 1
                Y(j) = 5;
            end
        end
        X(i) = mean(Y);
    end
    
    mean_val = mean(X);
    variance = var(X);
    
    % Calculate the ECDF
    [f, x] = ecdf(X);
    
    % Calculate the Normal CDF
    normal_cdf = normcdf(x, mean_val, sqrt(variance));
    
    figure;
    
    % Plot the ECDF
    plot(x, f, 'b', 'DisplayName', 'ECDF');
    hold on; % Hold the current plot
    
    % Plot the Normal CDF
    plot(x, normal_cdf, 'r', 'DisplayName', 'NormCDF');

    f=abs(f-normal_cdf);
    MAD(n_idx)=max(f);
    title(['ECDF and NormCDF for N = ', num2str(N)]);
    xlabel('Value');
    ylabel('Relative cumulative frequency');
    
    % Add legend
    legend('Location', 'best');
    
    % Save the figure as a PNG file
    filename = sprintf('ecdf_normcdf%d.png', N);
    saveas(gcf, filename);
    
    % Close the figure to prevent cluttering
    close(gcf);
end
figure;
plot(N_values,MAD,'r*-')
title('Maximum absolute difference (MAD) vs N');
xlabel('Value of N');
ylabel('MAD value');
filename = sprintf('MAD.png');
saveas(gcf,filename);
close(gcf);
