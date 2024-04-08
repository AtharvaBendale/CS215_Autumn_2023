function prob=EstimatedPDF(x,T,sigma)
    prob=0;
    for i=1:length(T)
        prob=prob+ exp(-(x-T(i))^2/(2*sigma^2));
    end
    prob=prob/(length(T)*sigma*sqrt(2*pi));
end