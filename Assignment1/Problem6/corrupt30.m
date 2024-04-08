z30 = y;
indice = randperm(301, 90);
for i=1:90
    z30(indice(i)) = z30(indice(i)) + 20*rand(1, 1) + 100;
end
clear i