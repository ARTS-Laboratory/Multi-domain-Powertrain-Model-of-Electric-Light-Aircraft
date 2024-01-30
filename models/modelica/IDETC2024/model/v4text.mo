model v4text
  Modelica.Electrical.Batteries.BatteryStacks.CellStack cellStack(Np = 4, Ns = 4, cellData = params)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Electrical.Batteries.ParameterRecords.CellData params(OCV_SOC = [0, 2.7/4.2; 0.0085, 3.131/4.2; 0.05, 3.35/4.2; 0.1, 3.49/4.2; 0.2, 3.55/4.2; 0.4, 3.65/4.2; 0.6, 3.75/4.2; 0.75, 3.85/4.2; 0.9, 4/4.2; 1, 4.2/4.2], OCVmax = 4.2, OCVmin = 2.7, Qnom = 2.6*(3600/4), Ri = 0.0466532698029283, SOCmax = 1, SOCmin = 0, useLinearSOCDependency = false)  annotation(
    Placement(visible = true, transformation(origin = {-50, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.MultiSensor multiSensor annotation(
    Placement(visible = true, transformation(origin = {-50, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I = 2.6)  annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-40, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(constantCurrent.n, cellStack.n) annotation(
    Line(points = {{-40, 0}, {-32, 0}, {-32, 50}, {-40, 50}}, color = {0, 0, 255}));
  connect(constantCurrent.p, multiSensor.nc) annotation(
    Line(points = {{-60, 0}, {-64, 0}, {-64, 10}, {-50, 10}, {-50, 14}}, color = {0, 0, 255}));
  connect(multiSensor.pc, cellStack.p) annotation(
    Line(points = {{-50, 34}, {-50, 36}, {-62, 36}, {-62, 50}, {-60, 50}}, color = {0, 0, 255}));
  connect(multiSensor.nv, cellStack.p) annotation(
    Line(points = {{-60, 24}, {-62, 24}, {-62, 50}, {-60, 50}}, color = {0, 0, 255}));
  connect(multiSensor.pv, cellStack.n) annotation(
    Line(points = {{-40, 24}, {-32, 24}, {-32, 50}, {-40, 50}}, color = {0, 0, 255}));
  connect(ground.p, constantCurrent.n) annotation(
    Line(points = {{-40, -6}, {-40, 0}}, color = {0, 0, 255}));

annotation(
    uses(Modelica(version = "4.0.0")));
end v4text;