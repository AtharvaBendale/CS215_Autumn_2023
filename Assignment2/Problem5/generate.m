T = 100000; %For the total number of rounds
N_values = [5, 10, 20, 50, 100, 200, 500, 1000, 5000, 10000];
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
        X(i)=mean(Y);
    end
    
    
    % Create a new figure for each histogram
    figure;
    histogram(X, 50);
    
    title(['Histogram for N = ', num2str(N)]);
    xlabel(sprintf('Average of %d random variables', N));
    ylabel('Frequency');
    
    % Save the figure as a PNG file
    filename = sprintf('Hist%d.png', N);
    saveas(gcf, filename);
    
    % Close the figure to prevent cluttering
    close(gcf);
end
