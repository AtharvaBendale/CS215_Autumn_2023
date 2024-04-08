COR = [];

for t=-10:10
    
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

varx = img1 - mean(mean(img1));
vary = img2 - mean(mean(img2));
covarxy = varx.*vary;
covarxy = sum(sum(covarxy));
varx = sum(sum(varx.^2));
vary = sum(sum(vary.^2));

corr_coeff = covarxy / sqrt(varx * vary);
COR = [COR, corr_coeff];
clear img2 img1 corr_coeff varx vary covarxy
end

plot(-t:1:t, COR, 'o-');
xlabel("t_x")
ylabel("ρ")
clear t;