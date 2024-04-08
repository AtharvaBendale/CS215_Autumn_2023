if t>0
    img1 = [IMAGE_1, zeros([r, t])];
    img2 = [zeros([r, t]), IMAGE_2];
end
if t==0
    img1 = IMAGE_1;
    img2 = IMAGE_2;
end
if t<0
    img1 = [zeros([r, -t]), IMAGE_1];
    img2 = [IMAGE_2, zeros([r, (-t)])];
end

p_I1_I2 = zeros(26, 26);

for i = 1:26
    for j = 1:26
        lowerBound1 = 10 * i - 10;
        upperBound1 = 10 * i;
        lowerBound2 = 10 * j - 10;
        upperBound2 = 10 * j;
        
        indicesArray1 = find(img1 >= lowerBound1 & img1 < upperBound1);
        
        indicesArray2 = find(img2 >= lowerBound2 & img2 < upperBound2);
        
        commonIndices = intersect(indicesArray1, indicesArray2);
       
        p_I1_I2(i, j) = length(commonIndices);
    end
end

p_I1_I2 = p_I1_I2/ sum(p_I1_I2(:));

p_I1 = sum(p_I1_I2, 2);

p_I2 = sum(p_I1_I2, 1);

E = p_I1_I2 - p_I1 * p_I2;

E = E .^ 2;

QMI = [QMI, sum(sum(E))];

clear i j img1 img2 p_I1 p_I2 p_I1_I2 E commonIndices indicesArray1 indicesArray2 lowerBound1 lowerBound2 upperBound1 upperBound2