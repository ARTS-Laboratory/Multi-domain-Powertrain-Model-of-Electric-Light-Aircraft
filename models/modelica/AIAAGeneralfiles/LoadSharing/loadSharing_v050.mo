model loadSharing_v050
  ElectricalEnergyStorage.Batteries.Cells.Basic.StaticResistance singleCell(SOCini = 0.86, TOperational = 293.15, cellParameters = batteryParams, useHeatPort = true) annotation(
    Placement(visible = true, transformation(origin = {-260, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-160, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.MultiSensor meter annotation(
    Placement(visible = true, transformation(origin = {-220, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //ChargeCapacity in A*s, for some reason
  parameter ElectricalEnergyStorage.CellRecords.StaticResistance.StaticResistanceParameters batteryParams(Rs = ElectricalEnergyStorage.CellRecords.Components.Resistance(R0 = 0.001), SOCOCV = ElectricalEnergyStorage.CellRecords.Components.SOCOCV(OCVtableOnFile = true, OCVtableName = "26650SOCvOVC", OCVfileName = "/media/nate/External/loadSharing/26650SOCvOCV_old.csv"), capacity = ElectricalEnergyStorage.CellRecords.Components.ChargeCapacity(C0 = 9360)) annotation(
    Placement(visible = true, transformation(origin = {-258, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant convCoeff(k = 3.60) annotation(
    Placement(visible = true, transformation(origin = {-290, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain(k = 1e-5) annotation(
    Placement(visible = true, transformation(origin = {-290, 56}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(visible = true, transformation(origin = {-290, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(fileName = "/media/nate/External/loadSharing/K2_50C_Discharge/testData.csv", tableName = "testData", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.NoTimeEvents) annotation(
    Placement(visible = true, transformation(origin = {-110, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor battHeatCap(C = 4.75, T(fixed = true, start = 323.195242), der_T(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-292, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent annotation(
    Placement(visible = true, transformation(origin = {-160, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature ambient annotation(
    Placement(visible = true, transformation(origin = {-330, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(fileName = "/media/nate/External/loadSharing/K2_50C_Discharge/ambientTemp.csv", tableName = "testData", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.NoTimeEvents) annotation(
    Placement(visible = true, transformation(origin = {-370, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(convCoeff.y, gain.u) annotation(
    Line(points = {{-290, 80}, {-290, 64}}, color = {0, 0, 127}));
  connect(gain.y, convection.Gc) annotation(
    Line(points = {{-290, 50}, {-290, 40}}, color = {0, 0, 127}));
  connect(convection.solid, singleCell.heatPort) annotation(
    Line(points = {{-280, 30}, {-266, 30}}, color = {191, 0, 0}));
  connect(battHeatCap.port, convection.solid) annotation(
    Line(points = {{-282, 0}, {-274, 0}, {-274, 30}, {-280, 30}}, color = {191, 0, 0}));
  connect(combiTimeTable.y[1], signalCurrent.i) annotation(
    Line(points = {{-120, 30}, {-148, 30}}, color = {0, 0, 127}));
  connect(meter.nv, singleCell.pin_n) annotation(
    Line(points = {{-220, 20}, {-220, 0}, {-260, 0}, {-260, 20}}, color = {0, 0, 255}));
  connect(meter.pc, singleCell.pin_p) annotation(
    Line(points = {{-230, 30}, {-240, 30}, {-240, 60}, {-260, 60}, {-260, 40}}, color = {0, 0, 255}));
  connect(meter.pv, singleCell.pin_p) annotation(
    Line(points = {{-220, 40}, {-220, 60}, {-260, 60}, {-260, 40}}, color = {0, 0, 255}));
  connect(ground.p, signalCurrent.p) annotation(
    Line(points = {{-160, -6}, {-160, 20}}, color = {0, 0, 255}));
  connect(signalCurrent.p, singleCell.pin_n) annotation(
    Line(points = {{-160, 20}, {-160, 0}, {-260, 0}, {-260, 20}}, color = {0, 0, 255}));
  connect(signalCurrent.n, meter.nc) annotation(
    Line(points = {{-160, 40}, {-160, 60}, {-200, 60}, {-200, 30}, {-210, 30}}, color = {0, 0, 255}));
  connect(combiTimeTable1.y[1], ambient.T) annotation(
    Line(points = {{-359, 30}, {-343, 30}}, color = {0, 0, 127}));
  connect(ambient.port, convection.fluid) annotation(
    Line(points = {{-320, 30}, {-300, 30}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-1000, -1000}, {1000, 1000}})),
    Icon(coordinateSystem(extent = {{-1000, -1000}, {1000, 1000}})),
    version = "",
    uses(ElectricalEnergyStorage(version = "3.2.2"), Modelica(version = "3.2.3")));
end loadSharing_v050;