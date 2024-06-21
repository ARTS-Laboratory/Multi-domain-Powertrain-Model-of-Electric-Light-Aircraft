model simpleFC
  
    // Parameters
    parameter Real E_oc = 65 "Open-circuit voltage";
    parameter Integer N = 65 "Number of cells per module";
    parameter Real A = 0.23 "Tafel slope (V)";
    parameter Real i_0 = 80 "Nominal exchange current (A)";
    parameter Real R_i = 0.05 "Internal resistance (ohms)";
    parameter Integer N_unit = 10 "Module units (Series)";
    parameter Real R_d = 0.1 "Dynamic resistance (ohms)";
    parameter Real C_dl = 0.01 "Double-layer capacitance (F)";
    parameter Real epsilon = 1e-6 "Small positive value to avoid log(0)";
  
    // Variables
    Real i_FC "Fuel cell current (A)";
    Real v_FC "Fuel cell terminal voltage (V)";
    Real v_d "Dynamic voltage drop (V)";
    Real E "Activation overpotential voltage (V)";
    Real tau "Time constant (s)";
    Real Pelec "Output power of Fuelcell (W)";
  
  equation
    // Calculate time constant
    tau = R_d * C_dl;
  
    // Activation overpotential equation
    E = E_oc - N * A * log(max(i_FC, epsilon) / i_0);
  
    // Fuel cell terminal voltage equation
    v_FC = N_unit * E - R_i * i_FC - v_d;
    
    // Dynamic voltage drop equation
    1/R_d * (tau * der(v_d) + v_d) = i_FC;
  
    //Output power
    Pelec = v_FC * i_FC;
    
end simpleFC;
