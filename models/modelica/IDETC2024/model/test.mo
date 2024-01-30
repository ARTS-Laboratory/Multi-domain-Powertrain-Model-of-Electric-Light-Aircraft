model test
  ElectricalEnergyStorage.Batteries.Stacks.Basic.StaticResistanceScaled stack1(SOCini = 0, cellParameters = cellParams, np = 12, ns = 96)  annotation(
    Placement(visible = true, transformation(origin = {6, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ElectricalEnergyStorage.Batteries.Stacks.Basic.StaticResistanceScaled stack2(SOCini = 0, cellParameters = cellParams, np = 12, ns = 96)  annotation(
    Placement(visible = true, transformation(origin = {6, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter ElectricalEnergyStorage.CellRecords.StaticResistance.StaticResistanceParameters cellParams(Rs = ElectricalEnergyStorage.CellRecords.Components.Resistance(R0 = 0.013164915387846383),SOCOCV = ElectricalEnergyStorage.CellRecords.Components.SOCOCV(OCVtableOnFile = true, OCVtableName = "18650SOCvOVC", OCVfileName = "/media/nate/External/IDETC_2024/186650Data/SOC%20Pulse%20Test/20C/20C_SOCOCV.csv"), capacity = ElectricalEnergyStorage.CellRecords.Components.ChargeCapacity(C0 = 12600))  annotation(
    Placement(visible = true, transformation(origin = {38, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I = -16)  annotation(
    Placement(visible = true, transformation(origin = {-42, 68}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent1(I = -16)  annotation(
    Placement(visible = true, transformation(origin = {-44, 16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-60, 42}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(constantCurrent1.p, stack2.pin_p) annotation(
    Line(points = {{-44, 26}, {-44, 34}, {6, 34}, {6, 26}}, color = {0, 0, 255}));
  connect(constantCurrent1.n, stack2.pin_n) annotation(
    Line(points = {{-44, 6}, {-44, -6}, {6, -6}, {6, 6}}, color = {0, 0, 255}));
  connect(constantCurrent.p, stack1.pin_p) annotation(
    Line(points = {{-42, 78}, {-40, 78}, {-40, 92}, {6, 92}, {6, 80}}, color = {0, 0, 255}));
  connect(stack1.pin_n, constantCurrent.n) annotation(
    Line(points = {{6, 60}, {6, 48}, {-42, 48}, {-42, 58}}, color = {0, 0, 255}));
  connect(ground.p, constantCurrent.n) annotation(
    Line(points = {{-50, 42}, {-42, 42}, {-42, 58}}, color = {0, 0, 255}));
  connect(ground.p, constantCurrent1.p) annotation(
    Line(points = {{-50, 42}, {-44, 42}, {-44, 26}}, color = {0, 0, 255}));

annotation(
    uses(ElectricalEnergyStorage(version = "3.2.2"), Modelica(version = "3.2.3")));
end test;