%% Donnees TP Temps Reel


%% Initilisation 
% Fonctions de base
clc
clear all

%% Initisation de l'exp�rimentation
%Frequence de PWM
FPWM = 20e3; % en Hz
TPWM = 1/FPWM; % en s
PWMmax = 3199;
% Temps mort
Tm = 0.5e-6; % en s
% Periode d'echantillonnage
Ts = 1e-4;
Tsmeca = 1e-2;
TsQEI = Tsmeca/5;   % QEI sampled 5 time faster than Tsmeca for filtering


%% Param�tres Banc
Vdc = 24;
Lignes = 250*4;



%% Filtre vitesse
try
    LPF_vit_Fc = 50;  % 50Hz
    [b,a] = butter(1,LPF_vit_Fc*TsQEI*2);    % Filter at 50 Hz (normalized frequency: 1 is Fnyquist)
     fct = tf(b,a,Ts);
    % figure(1); bode(fct);
    % figure(2); step(fct);
catch % if control toolbox not available
    b = [0.2452    0.2452];
    a = [1.0000   -0.5095];
end
