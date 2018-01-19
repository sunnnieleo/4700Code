function [ output_args ] = initalizeParticles( numbPartX, numbPartY, mass )
%initalizeParticles initalizes particles evenly spaced
%   Initalize particles in the center of the sceen in x and y dimentations
%   provided by the number of xand y particles defined in inputs

%initalize constants
PartSeperation = 1e-9; %1 nm inital spacing
x0 = 0; %inital posiotion for x
y0 = 0; %inital posiotion for y

%loop through the number x and rthen y particles, placing each in an inital position
for indexX = 0:numbPartX - 1
    numX = numX + 1;
    x(numX) = x0 * PartSeperation - indexX; %* cos(PartAng);
    
    %x(nAtoms) = x0 * AtomSpacing - Seper * p * AtomSpacing * cos(PartAng);
    %AtomType(numbPartX) = Type;
end

for indexY = 0:numbPartY - 1
    numY = numY + 1;
    y(numY) = y0 * PartSeperation - indexY;

    %y(numbPartX) = y0 * AtomSpacing - Seper * index * AtomSpacing * sin(PartAng);
    %AtomType(numbPartX) = Type;
end

end

