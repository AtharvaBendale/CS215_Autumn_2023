y_median30 = z30;
for i=1:301
    if i<9
        arr = z30(1:1:i+8);
        arr = sort(arr);
        y_median30(i) = median(arr);
    elseif i>293
        arr = z30(i-8:1:301);
        arr = sort(arr);
        y_median30(i) = median(arr);
    else
        arr = z30(i-8:1:i+8);
        arr = sort(arr);
        y_median30(i) = median(arr);
    end
end
clear i