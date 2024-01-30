model v3test
  ElectricalEnergyStorage.Batteries.Stacks.Basic.StaticResistanceScaled staticResistanceScaled(SOCini = 1, cellParameters = params, np = 4, ns = 4, useHeatPort = false) annotation(
    Placement(visible = true, transformation(origin = {-32, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter ElectricalEnergyStorage.CellRecords.StaticResistance.StaticResistanceParameters params(Rs = ElectricalEnergyStorage.CellRecords.Components.Resistance(R0 = 0.0466532698029283), SOCOCV = ElectricalEnergyStorage.CellRecords.Components.SOCOCV(OCVtableOnFile = false, OCVtable = [0, 2.7; 0.0085, 3.131; 0.05, 3.35; 0.1, 3.49; 0.2, 3.55; 0.4, 3.65; 0.6, 3.75; 0.75, 3.85; 0.9, 4; 1, 4.2]), capacity = ElectricalEnergyStorage.CellRecords.Components.ChargeCapacity(2.6*900)) annotation(
    Placement(visible = true, transformation(origin = {-60, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I = 2.6) annotation(
    Placement(visible = true, transformation(origin = {33, 51}, extent = {{-9, -9}, {9, 9}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-32, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.MultiSensor multiSensor annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(constantCurrent.n, multiSensor.nc) annotation(
    Line(points = {{33, 42}, {16, 42}, {16, 50}, {10, 50}}, color = {0, 0, 255}));
  connect(multiSensor.pc, staticResistanceScaled.pin_n) annotation(
    Line(points = {{-10, 50}, {-16, 50}, {-16, 30}, {-32, 30}, {-32, 38}}, color = {0, 0, 255}));
  connect(multiSensor.nv, staticResistanceScaled.pin_n) annotation(
    Line(points = {{0, 40}, {0, 30}, {-32, 30}, {-32, 38}}, color = {0, 0, 255}));
  connect(staticResistanceScaled.pin_p, constantCurrent.p) annotation(
    Line(points = {{-32, 58}, {-32, 72}, {33, 72}, {33, 60}}, color = {0, 0, 255}));
  connect(multiSensor.pv, staticResistanceScaled.pin_p) annotation(
    Line(points = {{0, 60}, {0, 72}, {-32, 72}, {-32, 58}}, color = {0, 0, 255}));
  connect(ground.p, staticResistanceScaled.pin_n) annotation(
    Line(points = {{-32, 14}, {-32, 38}}, color = {0, 0, 255}));
  annotation(
    uses(ElectricalEnergyStorage(version = "3.2.2"), Modelica(version = "3.2.3")));
end v3test;