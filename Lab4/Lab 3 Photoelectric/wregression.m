function [A,B,dA,dB] = wregression(x,y,dy)
%this function calculates slope, y intercept and uncertainty in both
%it also assumes that x, y and dy are of the same length
w = 1./(dy.^2);
%First we get the sums we will need to find our return values
w_sum = vecsum(w);
wy_sum = vecsum(w.*y);
wx_sum = vecsum(w.*x);
wxy_sum = vecsum(w.*x.*y);
wx2_sum = vecsum(w.*(x.^2));
%Now we find the value of D to be used later
D = (w_sum*wx2_sum) - (wx_sum^2);
%Here we use our sums along with D to find the return values
A = ((wx2_sum*wy_sum)-(wx_sum*wxy_sum))/D;
B = ((w_sum*wxy_sum)-(wx_sum*wy_sum))/D;
dA = sqrt(wx2_sum/D);
dB = sqrt(w_sum/D);
end