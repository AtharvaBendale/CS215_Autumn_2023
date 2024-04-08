y_median60 = z60;
for i=1:301
    if i<9
        arr = z60(1:1:i+8);
        arr = sort(arr);
        y_median60(i) = median(arr);
    elseif i>293
        arr = z60(i-8:1:301);
        arr = sort(arr);
        y_median60(i) = median(arr);
    else
        arr = z60(i-8:1:i+8);
        arr = sort(arr);
        y_median60(i) = median(arr);
    end
end
clear i