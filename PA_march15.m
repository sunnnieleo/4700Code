%% PA MNA building

R1 = 1; C = 0.25; R2 = 2; L = 0.2; R3 = 10; alpha = 100; R4 = 0.1; R0 = 1000;

C = zeros(7, 7);
G = zeros(7, 7);
V = [V1; V2; I2; V3; I3; V4; Vo];
F = zeros(legnth(V));

F(1) = Vin;
C(2, 1) = -cap;
C(2, 2) = cap;
C(3, 3) = -L;
G(1, 1) = 1;
G(2, 1) = -G2;
G(2, 2) = G1+G2;
G(2, 3) = -1;
G(3, 2) = 1;
G(3, 4) = -1;
G(4, 3) = -1;
G(4, 4) = G2;
G(5, 5) = -alpha;
G(5, 6) = 1;
G(6, 4) = G2;
G(6, 5) = -1;
G(7, 6) = -G4;
G(7, 7) = G4+G0;

