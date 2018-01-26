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


%initalize randome positions for particles
%randmone number between 0 and 100nm or 200nm to be within box
xlocations = rand(numP, 1).*200; 
ylocations = rand(numP, 1).*100;
positions = [xlocations, ylocations];

%generate a randome inital angle for each particle in rad
angle = rand(numP, 1).*2*pi; 
% % randome velocity and angle for each particle
% velocityX = rand(numP, 1).* cos(angle);
% velocityY = rand(numP, 1).* sin(angle);

% randome velocity angle with magnitude v_th 
velocityX = v_th.* cos(angle);
velocityY = v_th.* sin(angle);
velocity = [velocityX, velocityY];


for t =1:1:iterations
          
       %Keep position and velocity form previouse iteration
       oldP = positions;
       oldV = velocity;
       
       %Update x position and velocity
       % x is acting a a time element/step in F=ma ----
%        positions(:, 1) = positions(:, 1) + velocity(:, 1)*t;
       
       %Update y position and velocity       
%        positions(:, 2) = positions(:, 2) + velocity(:, 2)*t;

       %Boundary conditions
       for n=1:length(positions)
        %if positonX is >= left or right max bounds --> 
        %if positonX <= 0 set postionX = 200nm
        %if positonX >= 200nm set postionX = 0
            if positions(n, 1) <= 0
                
                positions(n, 1) = 200 + velocity(n, 1)*t;
                
            elseif positions(n, 1)>= 200
                
                positions(n, 1)=0+ velocity(n, 1)*t;
                
            else
                positions(n, 1) = positions(n, 1) + velocity(n, 1)*t;
            end                
       %if positonY is >= top or bottom max bounds --> 
            %if positonY <= 0 set velocity = -velocity
            %if positonY >= 100nm set velocity = -velocity
            if positions(n, 2) <= 0 
                positions(n, 2) = positions(:, 2) - velocity(n, 2)*t;
            elseif positions(n, 2) >= 100
                positions(n, 2) = positions(:, 2) - velocity(n, 2)*t;;
            end
       end
       %Plot x and y cordinated of position (.b indicates curent posioion
       %only) to plot lines save previouse point and plot the two points as
       %a line. Hold on will keep each segment plotted before
       figure (1)
       plot(positions(:, 1), positions(:, 2), '.b')
       hold on
%        plot(oldP(:, 1), oldP(:, 2), '.r')
       pause(0.2)  
       %axis([0 200 0 100])
       title ('Electron Simulation of Trajectories')

       %plot trjectories
       
end



