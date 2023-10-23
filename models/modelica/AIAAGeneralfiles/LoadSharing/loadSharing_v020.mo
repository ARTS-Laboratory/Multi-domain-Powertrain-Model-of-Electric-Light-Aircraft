model loadSharing_v020
  ElectricalEnergyStorage.Batteries.Cells.Basic.StaticResistance singleCell(SOCini = 1, cellParameters = batteryParams) annotation(
    Placement(visible = true, transformation(origin = {-260, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I = 5) annotation(
    Placement(visible = true, transformation(origin = {-160, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-160, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.MultiSensor meter annotation(
    Placement(visible = true, transformation(origin = {-220, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //ChargeCapacity in A*s, for some reason
  parameter ElectricalEnergyStorage.CellRecords.StaticResistance.StaticResistanceParameters batteryParams(Rs = ElectricalEnergyStorage.CellRecords.Components.Resistance(R0 = 0.0001), SOCOCV = ElectricalEnergyStorage.CellRecords.Components.SOCOCV(OCVtableOnFile = true, OCVtableName = "26650SOCvOVC", OCVfileName = "/media/nate/External/loadSharing/26650SOCvOCV_detail.csv"), capacity = ElectricalEnergyStorage.CellRecords.Components.ChargeCapacity(C0 = 9360)) annotation(
    Placement(visible = true, transformation(origin = {-290, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ground.p, constantCurrent.n) annotation(
    Line(points = {{-160, 20}, {-160, -6}}, color = {0, 0, 255}));
  connect(meter.nv, singleCell.pin_n) annotation(
    Line(points = {{-220, 20}, {-220, 0}, {-260, 0}, {-260, 20}}, color = {0, 0, 255}));
  connect(meter.pv, singleCell.pin_p) annotation(
    Line(points = {{-220, 40}, {-220, 60}, {-260, 60}, {-260, 40}}, color = {0, 0, 255}));
  connect(meter.pc, singleCell.pin_p) annotation(
    Line(points = {{-230, 30}, {-240, 30}, {-240, 60}, {-260, 60}, {-260, 40}}, color = {0, 0, 255}));
  connect(meter.nc, constantCurrent.p) annotation(
    Line(points = {{-210, 30}, {-200, 30}, {-200, 60}, {-160, 60}, {-160, 40}}, color = {0, 0, 255}));
  connect(constantCurrent.n, ground.p) annotation(
    Line(points = {{-160, 20}, {-160, 0}}, color = {0, 0, 255}));
  connect(constantCurrent.n, ground.p) annotation(
    Line(points = {{-160, 20}, {-160, 0}}, color = {0, 0, 255}));
  connect(constantCurrent.n, singleCell.pin_n) annotation(
    Line(points = {{-160, 20}, {-160, 0}, {-260, 0}, {-260, 20}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-1000, -1000}, {1000, 1000}})),
    Icon(coordinateSystem(extent = {{-1000, -1000}, {1000, 1000}})),
    version = "",
    uses(ElectricalEnergyStorage(version = "3.2.2"), Modelica(version = "3.2.3")));
end loadSharing_v020;