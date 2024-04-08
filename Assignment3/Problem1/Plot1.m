n=100000;
x=1:1:n;
y=zeros(n,1);
c=0;
for i= 1:n
    c=c+1/i;
    y(i)=c*i;
end

figure;
hold on;
plot(x,y,'r');
plot(x,x .* log(x),'b');
plot(x,x .* (1+log(x-1)),'g');
legend("E(X^{(n)})","N log(N)","N(1+ log(N-1))");
xlabel('Value of N');
ylabel('Value of function');
