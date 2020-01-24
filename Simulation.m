% Devan Harnett
% 100998173

global C 
    C.q_0 = 1.60217653e-19;             % electron charge
    C.hb = 1.054571596e-34;             % Dirac constant
    C.h = C.hb * 2 * pi;                    % Planck constant
    C.m_0 = 9.10938215e-31;             % electron mass
    C.kb = 1.3806504e-23;               % Boltzmann constant
    C.eps_0 = 8.854187817e-12;          % vacuum permittivity
    C.mu_0 = 1.2566370614e-6;           % vacuum permeability
    C.c = 299792458;                    % speed of light
    C.g = 9.80665;                      %metres (32.1740 ft) per s²

nTime = 1000; %time length of simulation 
x0 = 0; %initial position of 0 
v0 = 0; %initial velocity of 0 
V_vec = zeros(1,1);
T_vec = zeros(1,1);
X_vec = zeros(1,1);
D = 0; 
D_vec = zeros(1,1); 

for n =1 : nTime 
   t = n +1; 
   ti = n;
  
   vi = v0 + ((C.q_0 * 1)/C.m_0)*(t - ti);
   V_vec(n) = vi;
   T_vec(n) = t;
   D = D+ vi * t; 
   X_vec(n) = D; 
   
   i = abs(rand(1,1)); 
   if i < 0.05
       %V_vec(n) = -1*V_vec(n);
       vi = 0; 
   end 
   
   D_vec(n) = (X_vec(n)/T_vec(n));
   figure(1)
   subplot(2,1,1)
   plot(T_vec,V_vec)
   grid on 
   title (['velocity vs time, Drift Velocity is ',num2str(D_vec(n)),' m/s']) 
   xlabel 'time' 
   ylabel 'velocity'
   subplot(2,1,2)
   plot(T_vec,X_vec)
   grid on 
   title 'position vs time' 
   xlabel 'time' 
   ylabel 'position' 
   
   
   v0 = vi;
end 