Li = 0.306;
L_err = 0.005;
Aci = 0.00075908;
Ac_err= 0.0000005;

Acs = 0.00084432;
Ls = 0.078;

n1 = 160;
n2 = 150;
S = 0.1;
S_err = S*0.05;
R = 1e6;
R_err = R*0.01;
C = 0.5e-6;
C_err = C*0.02;


data1 = csvread('PRINT_12.csv',2,0);
data2 = csvread('PRINT_13.csv',2,0);
ti = data1(:,1)';
Vsi = data1(:,2)';
Vci = (data1(:,3)*-1)';
ts = data2(:,1)';

Vss = data2(:,2)';
Vcs = data2(:,3)';

%Analysis
%1 *still need to find remanence and coercive force for both samples
Hi = (n1/(Li*S)).*Vsi;
Bi = (R*C/(n2*Aci)).*Vci;
Hs = (n1/(Ls*S)).*Vss;
Bs = (R*C/(n2*Acs)).*Vcs;
figure(1)
hold on

plot(Hi,Bi,'.')
plot(Hs,Bs,'.')
title('Hysteresis Loops for Iron and Steel Samples')
%look up title in analysis rubric
xlabel('H [A/m]')
ylabel('B [T]')
legend('Iron Sample','Steel Sample')

remi = [];
coerci = [];
for i=1:length(Hi)-1
    if (Hi(i) >= 0 && Hi(i+1) < 0)
        remi(end + 1) = Bi(i);
        remi(end + 1) = Bi(i + 1);
    end
    
    if (Bi(i) >= 0 && Bi(i+1) < 0)
        coerci(end + 1) = Hi(i);
        coerci(end + 1) = Hi(i + 1);
    end
end
fprintf('Remanence of Iron %f +/- %f\n', mean(remi), std(remi)/sqrt(length(remi)));
fprintf('Coercive Force of Iron %f +/- %f\n', mean(coerci), std(coerci)/sqrt(length(coerci)));

rems = [];
coercs = [];
for i=1:length(Hs)-1
    if (Hs(i) >= 0 && Hs(i+1) < 0)
        rems(end + 1) = Bs(i);
        rems(end + 1) = Bs(i + 1);
    end
    
    if (Bs(i) >= 0 && Bs(i+1) < 0)
        coercs(end + 1) = Hs(i);
        coercs(end + 1) = Hs(i + 1);
    end
end
fprintf('Remanence of Steel %f +/- %f\n', mean(rems), std(rems)/sqrt(length(rems)));
fprintf('Coercive Force of Steel %f +/- %f\n', mean(coercs), std(coercs)/sqrt(length(coercs)));


ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';


%3
Ai = hysteresisarea(Hi,Bi); % Simpson integral
As = hysteresisarea(Hs,Bs); % Simpson integral
fprintf('Area of iron sample = %.2fW\n',Ai)
fprintf('Area of steel sample = %.2fW\n',As)

Vols = Acs*Ls;
Pi1 = (20.45e-3 - 12.41e-3)*2;
Pi2 = (20.45e-3 - 3.8e-3);
fi = 0.5*((1/Pi1) + (1/Pi2));
f_Err = 2;
Ps1 = (2.11e-2 - 1.24e-2)*2;
Ps2 = (2.11e-2 - 4.49e-3);
fs = 0.5*((1/Ps1)+(1/Ps2));

Voli = Aci*Li;
Pi = Ai*Voli*fi;
Ps = As*Vols*fs;
Pi_err = Pi * (L_err/Li + Ac_err/Aci + f_Err/fi);
Ps_err = Ps * (0.002/Ls + Ac_err/Acs + 2/fs);

Ps = As*Vols*fs;
fprintf('Power developped by iron sample = %.2fW +/- %2f\n',Pi, Pi_err)
fprintf('Power developped by steel sample = %.2fW +/- %f\n',Ps, Ps_err)
hold off;

%4
data3 = xlsread('Step7data.xlsx');
Vih = data3(:,2)'./1000;
Vih_err = data3(:, 4)'./10./1000;

Vib = data3(:,3)'./1000;
Vib_err = data3(:, 5)'./10./1000;

Hi4 = (n1/(Li*S)).*Vih;
Hi4_err = (L_err./Li + S_err./S + Vih_err./Vih) .* Hi4;
Bi4 = (R*C/(n2*Aci)).*Vib;
Bi4_err = Bi4.*(Ac_err./Aci + R_err./R + C_err./C + Vib_err./Vib);

figure(2)
errorbar(Hi4,Bi4, Bi4_err, Bi4_err, Hi4_err, Hi4_err);


xlabel('H [A/m]')
ylabel('B [T]')
title('Travelling Iron Sample Hyesteresis Corner due to Increasing Variac Voltage')
Uo = 4*pi*(10^-7); %http://physics.info/constants/
Ur = Bi4./Hi4./Uo;

Ur_err = Ur .* (Bi4_err./Bi4 +  Hi4_err./Hi4)./2;
figure(3)
errorbar(Hi4,Ur, Ur_err, Ur_err)
title('Relative Pemeability for Iron Sample')
xlabel('H [A/m]')
ylabel('Ur [N/A^2]')
[Ur_max,ind] = max(Ur);
Flux = Ur_max*Hi4(ind);
Flux_err = Flux .* (Ur_err(ind)./Ur_max  + Hi4_err(ind)./Hi4(ind));
fprintf('Maximum relative permeability: %.2f +/- %f \nFlux Density: %.2f +/- %f\n',Ur_max, Ur_err(ind), Flux, Flux_err)
