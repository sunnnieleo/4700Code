% % Assignment1: 100963181 Sonya Stuhec-Leonard

% Effective mass of electron Melectron = 0.26*m0, m0=rest mass
% nominal size of region is 200nm X 100nm
% Electron modeling


%constants
m0 = 9.109e-31; %in kg from source: https://en.wikipedia.org/wiki/Electron
Melectron = 0.26*m0;
k = physconst('Boltzmann'); %Constants in matlab source: https://www.mathworks.com/help/phased/ref/physconst.html?s_tid=gn_loc_drop
T = 300; % temperature in Kalvin

%define thermal velocity source: https://en.wikipedia.org/wiki/Thermal_velocity
v_th = sqrt(k*T/Melectron);

a1 = 3; %acceleration
F1= m0*a1;
numP = 10; %number of particles
iterations = 50; %number of iterations

%box definitions
xmax = 200e-9;
xmin = 0;
ymax = 100e-9;
ymin = 0;
%initalize randome positions for particles
%randmone number between 0 and 100nm or 200nm to be within box
xlocations = rand(numP, 1).*xmax;
ylocations = rand(numP, 1).*ymax;
positions = [xlocations, ylocations];

%generate a randome inital angle for each particle in rad
angle = rand(numP, 1).*2*pi;

% randome velocity angle with magnitude v_th
velocityX = v_th.* cos(angle);
velocityY = v_th.* sin(angle);
velocity = [velocityX, velocityY];

t = (200e-9/v_th)/100; %use 100 steps to get across the region 200nm long


for iter =1:1:iterations
    
    %Keep position and velocity form previouse iteration
    oldP = positions;
    oldV = velocity;
    
    %Boundary conditions
    for j=1:2
        for n=1:length(xlocations)
            positions(n, j) = positions(n, j) + velocity(n, j)*t;
            %if positonX is >= left or right max bounds -->
            %if positonX <= 0 set postionX = 200nm
            %if positonX >= 200nm set postionX = 0
            if j == 1
                if positions(n, 1) <= xmin
                    
                    positions(n, 1) = xmax + velocity(n, 1)*t;
                    
                elseif positions(n, 1)>= xmax
                    
                    positions(n, 1)= xmin + velocity(n, 1)*t;
                    
                end
            end
            %if positonY is >= top or bottom max bounds -->
            %if positonY <= 0 set velocity = -velocity
            %if positonY >= 100nm set velocity = -velocity
            if j == 2
                if positions(n, 2) <= ymin || positions(n, 2) >= ymax
                    velocity(n, 2) = -1*velocity(n, 2);%just negate y component
                    
                end
            end
        end
    end
    %Plot x and y cordinated of position (.b indicates curent posioion
    %only) to plot lines save previouse point and plot the two points as
    %a line. Hold on will keep each segment plotted before
    
    %to add colout put the plot i a loop, make an array of coulour, adn
    %for each plot of particle a select colout n form teh colour
    %array---
    
%     dim = [.2 .5 .3 .3];
    % Temperature formula from: https://en.wikipedia.org/wiki/Thermal_velocity
    temp = (mean(velocity(:, 1))^2 + mean(velocity(:, 2))^2)*Melectron/k;
    
    figure (1)
    plot(positions(:, 1), positions(:, 2), '.b')
    hold on
    pause(0.2)
    title ('Electron Simulation of Trajectories')
%     set(text(0.5, 0.5, 'value'), 'final val')
%     annotation('textbox',dim,'String','Temperature is %.2f', temp, 'FitBoxToText','on')
    
end



