y_quar60 = z60;
for i=1:301
    if i<9
        arr = z60(1:1:i+8);
        arr = sort(arr);
        arr = quantile(arr, 3);
        y_quar60(i) = arr(1);
    elseif i>293
        arr = z60(i-8:1:301);
        arr = sort(arr);
        arr = quantile(arr, 3);
        y_quar60(i) = arr(1);
    else
        arr = z60(i-8:1:i+8);
        arr = sort(arr);
        arr = quantile(arr, 3);
        y_quar60(i) = arr(1);
    end
end
clear i