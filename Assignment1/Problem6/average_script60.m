y_avg60=z60;
for i=1:301
c=0;
sum=0;
if i<9
for j=1:i+8
sum=sum+z60(j);
c=c+1;
end
y_avg60(i)=sum/c;
elseif i>293 
for j=i-8:301
sum=sum+z60(j);
c=c+1;
end
y_avg60(i)=sum/c;
else
for j=i-8:i+8
sum=sum+z60(j);
c=c+1;
end
y_avg60(i)=sum/c;
end
end
clear i j c sum