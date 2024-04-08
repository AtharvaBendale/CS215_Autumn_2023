z60 = y;
indice60 = randperm(301, 180);
for i=1:90
    z60(indice60(i)) = z60(indice60(i)) + 20*rand(1, 1) + 100;
end
clear i