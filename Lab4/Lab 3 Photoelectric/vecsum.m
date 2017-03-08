function [sum] = vecsum(RV)
%this function will input a row vector and return a sum of all the elements
L = length(RV);
i = 1;
sum = 0;
while i <= L
    sum = sum + RV(i);
    i = i + 1;
end
end