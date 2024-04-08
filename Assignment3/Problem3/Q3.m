clear;
tree=dlmread('XYZ.txt',',');
format long;
x = tree(:, 1);
y = tree(:, 2);
z = tree(:, 3);
[N, garbage] = size(x);
A = zeros(3, 3);
A(1, 1) = dot(x, x);
A(1, 2) = dot(x, y);
A(1, 3) = sum(x);
A(2, 1) = dot(x, y);
A(2, 2) = dot(y, y);
A(2, 3) = sum(y);
A(3, 1) = sum(x);
A(3, 2) = sum(y);
A(3, 3) = N;
B = zeros(3, 1);
B(1, 1) = dot(x, z);
B(2, 1) = dot(y, z);
B(3, 1) = sum(z);
soln = A\B;
var1 = soln(1);
var2 = soln(2);
var3 = soln(3);
noise = z - var1*x - var2*y - var3;
variance = sum(noise.^2)/N;
fprintf('The values of a, b, c in the equation of plane ax+by+c=z are\n a=%f, b=%f, c=%f.\n',var1,var2,var3')
fprintf('The predicted variance of the Gaussian noise is : %f',variance)
clear A B garbage N noise soln tree x y z