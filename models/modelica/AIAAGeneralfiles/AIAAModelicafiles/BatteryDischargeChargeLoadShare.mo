model BatteryDischargeChargeLoadShare "Discharge and charge idealized battery"
  extends Modelica.Icons.Example;
  parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData1(Qnom = 18000, OCVmax = 4.2, OCVmin = 2.5, Ri = cellData1.OCVmax/1200) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{60, 20}, {80, 40}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(transformation(extent = {{10, 0}, {30, 20}})));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent1 annotation(
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {0, 40})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor1 annotation(
    Placement(transformation(extent = {{10, 70}, {30, 90}})));
  Modelica.Blocks.Continuous.Integrator energy1(u(unit = "W"), y(unit = "J")) annotation(
    Placement(transformation(extent = {{60, 50}, {80, 70}})));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(
    Placement(transformation(extent = {{10, -100}, {30, -80}})));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent2 annotation(
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {0, -60})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor2 annotation(
    Placement(transformation(extent = {{10, -30}, {30, -10}})));
  Modelica.Blocks.Continuous.Integrator energy2(u(unit = "W"), y(unit = "J")) annotation(
    Placement(transformation(extent = {{60, -50}, {80, -30}})));
  Modelica.Blocks.Math.Gain gain(k = 300) annotation(
    Placement(visible = true, transformation(origin = {-16, 0}, extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
  CellStackTC battery1TC(CycleLife = 100, Np = 1, Ns = 1, RUL(fixed = true, start = .8), SOC(fixed = true, start = 1), cellData = cellData1) annotation(
    Placement(visible = true, transformation(origin = {44, 42}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData(OCVmax = 4.2, OCVmin = 2.5, Qnom = 18000, Ri = cellData1.OCVmax/1200) annotation(
    Placement(visible = true, transformation(origin = {0, -102}, extent = {{60, 20}, {80, 40}}, rotation = 0)));
  CellStackTC battery2TC(CycleLife = 100, Np = 1, Ns = 1, RUL(fixed = true, start = .6), SOC(fixed = true, start = 1), cellData = cellData) annotation(
    Placement(visible = true, transformation(origin = {44, -56}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  CustomPulse customPulse(nRepeats = 50, pulseWidth = 60, waitTime = 60) annotation(
    Placement(visible = true, transformation(origin = {-88, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  dividingmodel dividingmodel1 annotation(
    Placement(visible = true, transformation(origin = {-22, 2}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
equation
  battery1TC.RUL = dividingmodel1.RUL1;
  battery2TC.RUL = dividingmodel1.RUL2;
  battery1TC.SOC = dividingmodel1.SOC1;
  battery2TC.SOC = dividingmodel1.SOC2;
  connect(signalCurrent1.n, ground1.p) annotation(
    Line(points = {{0, 30}, {0, 20}, {20, 20}}, color = {0, 0, 255}));
  connect(signalCurrent1.p, powerSensor1.pc) annotation(
    Line(points = {{0, 50}, {0, 80}, {10, 80}}, color = {0, 0, 255}));
  connect(powerSensor1.nv, ground1.p) annotation(
    Line(points = {{20, 70}, {20, 20}}, color = {0, 0, 255}));
  connect(powerSensor1.pc, powerSensor1.pv) annotation(
    Line(points = {{10, 80}, {10, 90}, {20, 90}}, color = {0, 0, 255}));
  connect(powerSensor1.power, energy1.u) annotation(
    Line(points = {{10, 69}, {10, 60}, {58, 60}}, color = {0, 0, 127}));
  connect(signalCurrent2.n, ground2.p) annotation(
    Line(points = {{0, -70}, {0, -80}, {20, -80}}, color = {0, 0, 255}));
  connect(signalCurrent2.p, powerSensor2.pc) annotation(
    Line(points = {{0, -50}, {0, -20}, {10, -20}}, color = {0, 0, 255}));
  connect(powerSensor2.nv, ground2.p) annotation(
    Line(points = {{20, -30}, {20, -80}}, color = {0, 0, 255}));
  connect(powerSensor2.pc, powerSensor2.pv) annotation(
    Line(points = {{10, -20}, {10, -10}, {20, -10}}, color = {0, 0, 255}));
  connect(powerSensor2.power, energy2.u) annotation(
    Line(points = {{10, -31}, {10, -40}, {58, -40}}, color = {0, 0, 127}));
  connect(battery1TC.p, powerSensor1.nc) annotation(
    Line(points = {{44, 52}, {44, 80}, {30, 80}}, color = {0, 0, 255}));
  connect(battery1TC.n, ground1.p) annotation(
    Line(points = {{44, 32}, {44, 20}, {20, 20}}, color = {0, 0, 255}));
  connect(battery2TC.p, powerSensor2.nc) annotation(
    Line(points = {{44, -46}, {44, -20}, {30, -20}}, color = {0, 0, 255}));
  connect(battery2TC.n, ground2.p) annotation(
    Line(points = {{44, -66}, {44, -80}, {20, -80}}, color = {0, 0, 255}));
  connect(customPulse.y, gain.u) annotation(
    Line(points = {{-78, 0}, {-68, 0}}, color = {0, 0, 127}));
  connect(gain.y, dividingmodel1.Load) annotation(
    Line(points = {{-44, 0}, {-30, 0}}, color = {0, 0, 127}));
  connect(dividingmodel1.Bat1Load, signalCurrent1.i) annotation(
    Line(points = {{-18, 14}, {-12, 14}, {-12, 40}}, color = {0, 0, 127}));
  connect(dividingmodel1.Bat2Load, signalCurrent2.i) annotation(
    Line(points = {{-26, 14}, {-12, 14}, {-12, -60}}, color = {0, 0, 127}));
  annotation(
    experiment(StopTime = 3600, Interval = 0.1, Tolerance = 1e-06),
    Documentation(info = "<html>
<p>Two batteries with a nominal charge of 10 A.h starting with an initial SOC = 95 % are compared:</p>
<ul>
<li><code>battery1</code> is a battery OCV linearly dependent on SOC, without self-discharge and not comprising RC-elements.</li>
<li><code>battery2</code> is a battery OCV dependency on SOC is specified by a table, with self-discharge and including RC-elements.</li>
</ul>
<p>
Two <a href=\"modelica://Modelica.Electrical.Batteries.ParameterRecords.CellData\">parameter records</a> <code>cellData1</code> and <code>cellData2</code> are used to parameterize the battery models.
</p>
<p>
First the batteries are discharged with 7 current pulses of 50 A for 1 minute, and breaks between the pulses of 1 minute, ending at SOC = 5 %.<br>
Subsequently, the batteries are charged again with 7 current pulses of 50 A for 1 minute, and breaks between the pulses of 1 minute, ending at SOC = 95 % again.<br>
In the end, the batteries are in no-load condition to reveal self-discharge effects.
Note that self-discharge of <code>battery2</code> is set to an unrealistic high value, to show self-discharge within a rather short time span.<br>
The parameters of the RC-elements of <code>battery2</code> are set to estimated values, just to demonstrate the effects.
</p>
<p>Simulate and plot terminal voltage <code>battery1.v</code> and <code>battery2.v</code> as well as state of charge <code>battery1.SOC</code> and <code>battery2.SOC</code>.</p>
<p>
Plotting <code>energy1.y</code> and <code>energy2.y</code>, it is remarkable that first energy is delivered by the battery,
but then due to the losses more energy is consumed to recharge the battery.
</p>
</html>"),
    uses(Modelica(version = "4.0.0")),
    Diagram);
end BatteryDischargeChargeLoadShare;
