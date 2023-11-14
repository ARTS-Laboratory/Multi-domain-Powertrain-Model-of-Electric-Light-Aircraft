model dividingmodelequalize

  //Initialize the inputs and outputs of the model
  Modelica.Blocks.Interfaces.RealInput RUL1(min=0, max=1) annotation(
    Placement(visible = true, transformation(origin = {-100, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput RUL2(min=0, max=1) annotation(
    Placement(visible = true, transformation(origin = {-100, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Load annotation(
    Placement(visible = true, transformation(origin = {-50, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-20, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput Bat1Load annotation(
    Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Bat2Load annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput SOC1(min=0, max=1) annotation(
    Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput SOC2(min=0, max=1) annotation(
    Placement(visible = true, transformation(origin = {-100, -90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Real RULDIFF;
  Real hysteresis_threshold = 0.0001;  // Threshold for RUL difference
  Real hysteresis_buffer = 0.00005;    // Buffer to prevent getting stuck in a loop
  Boolean isLoadShared;                // Boolean to specify if in a load sharing state
  
 algorithm
  if RULDIFF <= (hysteresis_threshold - hysteresis_buffer) then
    // Enter shared load state
    isLoadShared := true;
  elseif RULDIFF >= (hysteresis_threshold + hysteresis_buffer) then
    // Exit shared load state
    isLoadShared := false;
  end if;

  
equation
  //Calculate the absolute value of the difference in RUL
  RULDIFF = abs(RUL1 - RUL2);
  
    //If one battery has a higher RUL and can take current then prioritize it    
  Bat1Load = if SOC1 > 0.001 and RUL1 > RUL2 and Load > 0 and not isLoadShared then Load 
    elseif SOC1 > 0.001 and SOC2 < 0.001 and Load > 0 then Load     
    //Send full load to battery if one is full or empty
    elseif SOC1 < .999 and RUL1 > RUL2 and Load < 0 and not isLoadShared then Load    
    elseif SOC1 < .999 and SOC2 > .999 and Load < 0 then Load      
    //If Both batteries are within the threshold and can split load give load /2
    elseif SOC2 > 0.001 and SOC1 > 0.001 and Load > 0 and isLoadShared then Load / 2   
    elseif SOC1 < .999 and SOC2 < .999 and Load < 0 and isLoadShared then Load / 2
    else 0;
    //If one battery has a higher RUL and can take current then prioritize it
  Bat2Load = if SOC2 > 0.001 and RUL2 > RUL1 and Load > 0 and not isLoadShared then Load
    elseif SOC2 < .999 and RUL2 > RUL1 and Load < 0 and not isLoadShared then Load
    //Send full load to battery if one is full or empty
    elseif SOC2 > 0.001 and SOC1 < 0.001 and Load > 0 then Load 
    elseif SOC2 < .999 and SOC1 > .999 and Load < 0 then Load
    //If Both batteries are within the threshold and can split load give load /2
    elseif SOC2 > 0.001 and SOC1 > 0.001 and Load > 0 and isLoadShared then Load / 2   //If RUL is equal share load
    elseif SOC1 < .999 and SOC2 < .999 and Load < 0 and isLoadShared then Load / 2
    else 0;

end dividingmodelequalize;
