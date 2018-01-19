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

%makebox

%initiate particles (position, mass) 
XParticles = 2;
YParticles = 3;
initalizeParticles( XParticles, YParticles, Melectron )

%move particles at velocity V_th @T=300K
    %update particles every DeltaT using Newton's laws
    %Delta t must take into account the size of region and the velocity of
    %particles (smaller than 1/100th of region size). Simulate nominally
    %steps of 1000 timesteps at a time.
    

%trace particles using plot (to show trajectories keep priviouse positions
%x and y). Update polt with time step


%boundary conditions
    %x - periodic BC, y - reflective @same angle &maintain velocity
    



