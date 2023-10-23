model signalCurrentTest
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {26, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent annotation(
    Placement(visible = true, transformation(origin = {26, 28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(fileName = "/media/nate/External/loadSharing/testData.csv", tableName = "testData", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {76, 28}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor annotation(
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(combiTimeTable.y[1], signalCurrent.i) annotation(
    Line(points = {{65, 28}, {37, 28}}, color = {0, 0, 127}));
  connect(ground.p, signalCurrent.n) annotation(
    Line(points = {{26, -8}, {26, 18}}, color = {0, 0, 255}));
  connect(resistor.p, signalCurrent.p) annotation(
    Line(points = {{-20, 40}, {-20, 60}, {26, 60}, {26, 38}}, color = {0, 0, 255}));
  connect(resistor.n, signalCurrent.n) annotation(
    Line(points = {{-20, 20}, {-20, 6}, {26, 6}, {26, 18}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.3")));end signalCurrentTest;