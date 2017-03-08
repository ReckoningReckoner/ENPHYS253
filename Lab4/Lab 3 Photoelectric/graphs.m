b1 = csvread('Data/partb.csv', 1);
b2 = csvread('Data/partbyellow.csv', 1);
c = csvread('Data/partc.csv', 1, 1);

e = 1.602e-19;
trans = b1(:,1).'./100;
b1pot = b1(:,2).';
b1time = b1(:,3).';
b1error = ones(size(b1time));

b2pot = b2(:,2).';
b2time = b2(:,3).';
b2error = ones(size(b2time));

cpot = c(:,2).';
cpot_err = c(:,3).';
cfreq = c(:,1).*10^14;
cfreq = cfreq.';

figure(1)
hold on
errorbar(trans, b1time, b1error, '.', 'Color', [39/255, 196/255, 0]);
errorbar(trans, b2time, b2error, '.', 'Color', [255/255, 187/255, 0]);
title('Photoelectric Effect: Time to Reach Stopping Potential for Hg Spectrum Green and Yellow Light')
xlabel('Transmission Percentage')
ylabel('Time [s]')
legend('Green Light', 'Yellow Light')
saveas(gcf,'../img/exponential.png')
hold off

figure(3)
hold on
errorbar(log(trans), b1time, b1error, '.', 'Color', [39/255, 196/255, 0]);
[intercept1,slope1,~, ~] = wregression(log(trans), b1time, b1error);
plot(log(trans), slope1 * log(trans) + intercept1)
text(-1.2, 20.1, sprintf('t = %.3g * ln(Transmission percent) + %.3g', slope1, intercept1));
xlabel('ln(Transmission percent)')

errorbar(log(trans), b2time, b2error, '.', 'Color', [255/255, 187/255, 0]);
[intercept2,slope2,~, ~] = wregression(log(trans), b2time, b2error);
plot(log(trans), slope2 * log(trans) + intercept2)
text(-1.2, 17.7, sprintf('t = %.3g * ln(Transmission percent) + %.3g', slope2, intercept2));
xlabel('ln(Transmission percent)')
saveas(gcf,'../img/linear.png')

title('Photoelectric Effect: Linear Model for Stopping Potential Time')
ylabel('Time [s]')
legend('Green Light', 'Linear Regression for Green Light' ,'Yellow Light',...
       'Linear Regression for Yellow Light','Location','southwest')
hold off

figure(2)
hold on;
[we,he,dwe,dhe] = wregression(cfreq,cpot,cpot_err);
errorbar(cfreq,cpot,cpot_err,'.r')
plot(cfreq, he .* cfreq + we);
text(6.8e14, 1.2, sprintf('V = %.3g * f %.3g', he, we));
title('Phtoelectric Effect: Stopping Potential Measured with Variable Hg Spectrum Lights')
xlabel('Frequency of Light [Hz]')
ylabel('Stopping Potential [V]')
legend('Measued Value', 'Linear Regression', 'Location', 'northwest')
hold off;
saveas(gcf,'../img/stopping.png')

w = -we*e
dw = abs(w*(dwe/we))
we
dwe
h = he*e
dh = abs(h*(dhe/he))

%% Residual Values
hold on;
figure(4)
plot(log(trans), b1time - (slope1 * log(trans) + intercept1), '--o')
title('Residuals for Stopping Potential Linear Model with Yellow Light')
xlabel('ln(Transmission Percentage)')
ylabel('Residual Value')
hold off;
saveas(gcf,'../img/residyellow.png')

hold on;
figure(5)
plot(log(trans), b2time - (slope2 * log(trans) + intercept2), '--o')
title('Residuals for Stopping Potential Linear Model with Green Light')
xlabel('ln(Transmission Percentage)')
ylabel('Residual Value')
saveas(gcf,'../img/residgreen.png')
hold off;
