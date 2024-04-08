y_quar30 = z30;
for i=1:301
    if i<9
        arr = z30(1:1:i+8);
        arr = sort(arr);
        arr = quantile(arr, 3);
        y_quar30(i) = arr(1);
    elseif i>293
        arr = z30(i-8:1:301);
        arr = sort(arr);
        arr = quantile(arr, 3);
        y_quar30(i) = arr(1);
    else
        arr = z30(i-8:1:i+8);
        arr = sort(arr);
        arr = quantile(arr, 3);
        y_quar30(i) = arr(1);
    end
end
clear i