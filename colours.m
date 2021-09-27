FIS = newfis('Colour Classification');

% --INPUT 1: Hue--
FIS = addvar(FIS, 'input', 'Hue',[0, 360]);
sigI1 = 10; %Sigma value for the gaussmf plots
FIS = addmf(FIS, 'input', 1, 'Red(1)', 'gaussmf', [sigI1, 0]);
FIS = addmf(FIS, 'input', 1, 'Yellow', 'gaussmf', [sigI1, 60]);
FIS = addmf(FIS, 'input', 1, 'Green', 'gaussmf', [sigI1, 120]);
FIS = addmf(FIS, 'input', 1, 'Cyan', 'gaussmf', [sigI1, 180]);
FIS = addmf(FIS, 'input', 1, 'Blue', 'gaussmf', [sigI1, 240]);
FIS = addmf(FIS, 'input', 1, 'Magenta', 'gaussmf', [sigI1, 300]);
FIS = addmf(FIS, 'input', 1, 'Red(2)', 'gaussmf', [sigI1, 360]);

% --INPUT 2: Saturation--
FIS = addvar(FIS, 'input', 'Saturation', [0, 100]);
FIS = addmf(FIS, 'input', 2, 'Monochrome', 'trapmf', [0 0 5 10]);
FIS = addmf(FIS, 'input', 2, 'Desaturated', 'trapmf', [5 10 50 55]);
FIS = addmf(FIS, 'input', 2, 'Normal', 'trapmf', [50 55 80 90]);
FIS = addmf(FIS, 'input', 2, 'Pure', 'trapmf', [80 90 100 100]);

% --INPUT 3: Value--
FIS = addvar(FIS, 'input', 'Value', [0, 100]);
FIS = addmf(FIS, 'input', 3, 'Black', 'trapmf', [0 0 5 10]);
FIS = addmf(FIS, 'input', 3, 'Dark', 'trapmf', [5 10 35 40]);
FIS = addmf(FIS, 'input', 3, 'Normal', 'trapmf', [35 40 70 75]); 
FIS = addmf(FIS, 'input', 3, 'Bright', 'trapmf', [70 75 100 100]);


% --OUTPUT 1: Temperature--
FIS = addvar(FIS, 'output', 'Temperature',[0 100]);
FIS = addmf(FIS, 'output', 1, 'Cold', 'trapmf', [0 0 15 20]);
FIS = addmf(FIS, 'output', 1, 'Cool', 'trapmf', [15 20 35 40]);
FIS = addmf(FIS, 'output', 1, 'Neutral', 'trapmf', [35 40 60 65]);
FIS = addmf(FIS, 'output', 1, 'Warm', 'trapmf', [60 65 80 85]);
FIS = addmf(FIS, 'output', 1, 'Hot', 'trapmf', [80 85 100 100]);


% --RULEBASE--
rule1 = [0 0 1 1 1 1];
rule2 = [0 1 0 3 1 1];
rule3 = [2 3 3 4 1 1];
rule4 = [0 1 -1 2 0.5 1];

ruleList = [rule1;rule2;rule3;rule4];

FIS = addrule(FIS, ruleList);

showrule(FIS);
ruleview(FIS);

%Print FIS
figure(1)
subplot(3,1,1), plotmf(FIS, 'input', 1)
subplot(3,1,2), plotmf(FIS, 'input', 2)
subplot(3,1,3), plotmf(FIS, 'input', 3)

figure(2)
subplot(3,1,1), plotmf(FIS, 'output', 1)