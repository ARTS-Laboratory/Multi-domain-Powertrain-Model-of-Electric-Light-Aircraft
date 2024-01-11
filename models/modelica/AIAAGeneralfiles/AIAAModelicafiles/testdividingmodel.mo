model testdividingmodel


  Real total;
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
equation

  total = RUL1 + RUL2;
  Bat1Load = if total <> 0 and SOC2 > 0 then Load * (RUL1 / total) else Load;
  Bat2Load = if total <> 0 and SOC1 > 0 then Load * (RUL2 / total) else Load;
  



end testdividingmodel;
