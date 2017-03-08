function regressionplot(x,y,dy)
hold on
errorbar(x,y,dy,'rx') 
xfit = linspace(0,x(length(x)));
[A,B,dA,dB] = wregression(x,y,dy);
yfit = xfit*B + A;
plot(xfit,yfit)
hold off
end
