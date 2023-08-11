model testbedModel_v010
  replaceable package Medium = Modelica.Media.Water.StandardWaterOnePhase constrainedby Modelica.Media.Interfaces.PartialMedium;
  constant Integer m = 3 "Number of phases";
  parameter Modelica.Units.SI.Voltage VNominal = 100 "Nominal RMS voltage per phase";
  parameter Modelica.Units.SI.Frequency fNominal = 60 "Nominal frequency";
  parameter Modelica.Units.SI.Torque TLoad = 161.4 "Nominal load torque";
  parameter Modelica.Units.SI.AngularVelocity wLoad(displayUnit = "rev/min") = 1440.45*2*Modelica.Constants.pi/60 "Nominal load speed";
  parameter Modelica.Units.SI.Inertia JLoad = 0.29 "Load's moment of inertia";
  Modelica.Mechanics.Rotational.Components.Inertia dynoInertia(J = 0.00601) annotation(
    Placement(visible = true, transformation(origin = {248, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 0.0111) annotation(
    Placement(visible = true, transformation(origin = {280, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Machines.BasicMachines.InductionMachines.IM_SquirrelCage imc(Jr = aimcData.Jr, Js = aimcData.Js, Lm = aimcData.Lm, Lrsigma = aimcData.Lrsigma, Lssigma = aimcData.Lssigma, Lszero = aimcData.Lszero, Rr = aimcData.Rr, Rs = aimcData.Rs, TrOperational = 293.15, TrRef = aimcData.TrRef, TsOperational = 293.15, TsRef = aimcData.TsRef, alpha20r = aimcData.alpha20r, alpha20s(displayUnit = "1/K") = aimcData.alpha20s, frictionParameters = aimcData.frictionParameters, fsNominal = aimcData.fsNominal, p = aimcData.p, phiMechanical(displayUnit = "rad", fixed = true), statorCoreParameters = aimcData.statorCoreParameters, strayLoadParameters = aimcData.strayLoadParameters, useSupport = false, useThermalPort = false, wMechanical(displayUnit = "rpm", fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {80, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Electrical.Machines.Utilities.ParameterRecords.IM_SquirrelCageData aimcData( Rr(displayUnit = "mOhm"), Rs(displayUnit = "Ohm")) annotation(
    Placement(visible = true, transformation(origin = {66, 84}, extent = {{-20, -80}, {0, -60}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
    Placement(visible = true, transformation(origin = {178, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation(
    Placement(visible = true, transformation(origin = {200, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(terminalConnection = "D") annotation(
    Placement(visible = true, transformation(origin = {80, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Sensors.VoltageQuasiRMSSensor voltageRMSSensor annotation(
    Placement(visible = true, transformation(origin = {80, 32}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {238, 64}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 60/(2*3.14159)) annotation(
    Placement(visible = true, transformation(origin = {288, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Machines.Sensors.CurrentQuasiRMSSensor currentRMSSensor annotation(
    Placement(visible = true, transformation(origin = {80, 68}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Electrical.Polyphase.Basic.Star star annotation(
    Placement(visible = true, transformation(origin = {100, 128}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {144, 128}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Batteries.BatteryStacks.CellStack cellStack(cellData = cellData, useHeatPort = true) annotation(
    Placement(visible = true, transformation(origin = {-56, 188}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData(OCVmax = 220, OCVmin = 110, Qnom = 216000, Ri = cellData.OCVmax/1200, alpha = 0.0001) annotation(
    Placement(visible = true, transformation(origin = {-56, 216}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent annotation(
    Placement(visible = true, transformation(origin = {-102, 136}, extent = {{10, -10}, {-10, 10}}, rotation = -180)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-118, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation(
    Placement(visible = true, transformation(origin = {-40, 156}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sine(constantFrequency = 60, useConstantFrequency = true)  annotation(
    Placement(visible = true, transformation(origin = {-31, 103}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1/sqrt(2))  annotation(
    Placement(visible = true, transformation(origin = {-40, 116}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sineVariableFrequencyAndAmplitude(constantFrequency = 60, phi(start = -2*3.14159/3), useConstantFrequency = true) annotation(
    Placement(visible = true, transformation(origin = {-31, 89}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sineVariableFrequencyAndAmplitude1(constantFrequency = 60, phi(start = -4*3.14159/3), useConstantFrequency = true) annotation(
    Placement(visible = true, transformation(origin = {-31, 75}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex3 multiplex3 annotation(
    Placement(visible = true, transformation(origin = {49, 89}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Sources.SignalVoltage signalVoltage annotation(
    Placement(visible = true, transformation(origin = {80, 90}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Torque torque(useSupport = false)  annotation(
    Placement(visible = true, transformation(origin = {312, 12}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 50, f = 1/60, offset = 50)  annotation(
    Placement(visible = true, transformation(origin = {352, 12}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  
  Modelica.Fluid.Machines.PrescribedPump pump(redeclare package Medium = Medium,redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.25, 0.5}, head_nominal = {100, 60, 0}),N_nominal = 1200, T_start = system.T_start, V = 1, allowFlowReversal = false, checkValve = true, checkValveHomotopy = Modelica.Fluid.Types.CheckValveHomotopyType.Closed, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial) annotation(
    Placement(visible = true, transformation(origin = {-38, -108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = Medium,V = 10, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-132, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Pipes.DynamicPipe leg3(redeclare package Medium = Medium,allowFlowReversal = false, diameter = 0.01, length = 0.5, useLumpedPressure = true, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {90, -108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe leg1(redeclare package Medium = Medium,allowFlowReversal = false, diameter = 0.01, length = 0.5, useLumpedPressure = true, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {2, -108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(redeclare package Medium = Medium,allowFlowReversal = false, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial) annotation(
    Placement(visible = true, transformation(origin = {22, -156}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe leg2(redeclare package Medium = Medium,allowFlowReversal = false, diameter = 0.01, length = 0.5, useLumpedPressure = true, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {46, -108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15) annotation(
    Placement(visible = true, transformation(origin = {150, -16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(visible = true, transformation(origin = {150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const1(k = 10) annotation(
    Placement(visible = true, transformation(origin = {118, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollector(m = 6) annotation(
    Placement(visible = true, transformation(origin = {80, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector statorWinding annotation(
    Placement(visible = true, transformation(origin = {80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(dynoInertia.flange_b, damper.flange_a) annotation(
    Line(points = {{258, 12}, {270, 12}}));
  connect(imc.flange, torqueSensor.flange_a) annotation(
    Line(points = {{90, 12}, {190, 12}}));
  connect(torqueSensor.flange_b, dynoInertia.flange_a) annotation(
    Line(points = {{210, 12}, {238, 12}}));
  connect(imc.plug_sp, terminalBox.plug_sp) annotation(
    Line(points = {{86, 22}, {86, 50}}, color = {0, 0, 255}));
  connect(imc.plug_sn, terminalBox.plug_sn) annotation(
    Line(points = {{74, 22}, {74, 50}}, color = {0, 0, 255}));
  connect(voltageRMSSensor.plug_p, imc.plug_sp) annotation(
    Line(points = {{86, 32}, {86, 22}}, color = {0, 0, 255}));
  connect(voltageRMSSensor.plug_n, imc.plug_sn) annotation(
    Line(points = {{74, 32}, {74, 22}}, color = {0, 0, 255}));
  connect(speedSensor.w, product.u2) annotation(
    Line(points = {{178, 51}, {178, 51.5}, {250, 51.5}, {250, 58}}, color = {0, 0, 127}));
  connect(const.y, product.u1) annotation(
    Line(points = {{277, 70}, {250, 70}}, color = {0, 0, 127}));
  connect(speedSensor.flange, imc.flange) annotation(
    Line(points = {{178, 30}, {178, 12}, {90, 12}}));
  connect(currentRMSSensor.plug_p, terminalBox.plugSupply) annotation(
    Line(points = {{80, 62}, {80, 52}}, color = {0, 0, 255}));
  connect(ground1.p, star.pin_n) annotation(
    Line(points = {{134, 128}, {110, 128}}, color = {0, 0, 255}));
  connect(cellStack.p, signalCurrent.p) annotation(
    Line(points = {{-66, 188}, {-118, 188}, {-118, 136}, {-112, 136}}, color = {0, 0, 255}));
  connect(ground.p, signalCurrent.p) annotation(
    Line(points = {{-118, 118}, {-118, 136}, {-112, 136}}, color = {0, 0, 255}));
  connect(cellStack.n, signalCurrent.n) annotation(
    Line(points = {{-46, 188}, {6, 188}, {6, 136}, {-92, 136}}, color = {0, 0, 255}));
  connect(voltageSensor.n, cellStack.n) annotation(
    Line(points = {{-30, 156}, {6, 156}, {6, 188}, {-46, 188}}, color = {0, 0, 255}));
  connect(voltageSensor.p, cellStack.p) annotation(
    Line(points = {{-50, 156}, {-118, 156}, {-118, 188}, {-66, 188}}, color = {0, 0, 255}));
  connect(voltageSensor.v, gain.u) annotation(
    Line(points = {{-40, 145}, {-40, 121}}, color = {0, 0, 127}));
  connect(gain.y, sine.amplitude) annotation(
    Line(points = {{-40, 111.6}, {-40, 105.6}, {-37, 105.6}}, color = {0, 0, 127}));
  connect(gain.y, sineVariableFrequencyAndAmplitude.amplitude) annotation(
    Line(points = {{-40, 111.6}, {-40, 91.6}, {-37, 91.6}}, color = {0, 0, 127}));
  connect(gain.y, sineVariableFrequencyAndAmplitude1.amplitude) annotation(
    Line(points = {{-40, 111.6}, {-40, 78}, {-37, 78}}, color = {0, 0, 127}));
  connect(sine.y, multiplex3.u1[1]) annotation(
    Line(points = {{-25.5, 103}, {-8, 103}, {-8, 92.5}, {43, 92.5}}, color = {0, 0, 127}));
  connect(sineVariableFrequencyAndAmplitude.y, multiplex3.u2[1]) annotation(
    Line(points = {{-25.5, 89}, {43, 89}}, color = {0, 0, 127}));
  connect(currentRMSSensor.plug_n, signalVoltage.plug_p) annotation(
    Line(points = {{80, 74}, {80, 84}}, color = {0, 0, 255}));
  connect(multiplex3.y, signalVoltage.v) annotation(
    Line(points = {{54.5, 89}, {61.25, 89}, {61.25, 90}, {73, 90}}, color = {0, 0, 127}, thickness = 0.5));
  connect(sineVariableFrequencyAndAmplitude1.y, multiplex3.u3[1]) annotation(
    Line(points = {{-25.5, 75}, {-8, 75}, {-8, 85.5}, {43, 85.5}}, color = {0, 0, 127}));
  connect(star.plug_p, signalVoltage.plug_n) annotation(
    Line(points = {{90, 128}, {80, 128}, {80, 96}}, color = {0, 0, 255}));
  connect(currentRMSSensor.I, signalCurrent.i) annotation(
    Line(points = {{86, 68}, {92, 68}, {92, 60}, {-102, 60}, {-102, 124}}, color = {0, 0, 127}));
  connect(torque.flange, damper.flange_b) annotation(
    Line(points = {{302, 12}, {290, 12}}));
  connect(sine1.y, torque.tau) annotation(
    Line(points = {{342, 12}, {324, 12}}, color = {0, 0, 127}));
  connect(leg3.port_b, volume.ports[2]) annotation(
    Line(points = {{100, -108}, {136, -108}, {136, -200}, {-122, -200}, {-122, -110}}, color = {0, 127, 255}));
  connect(leg1.port_b, leg2.port_a) annotation(
    Line(points = {{12, -108}, {36, -108}}, color = {0, 127, 255}));
  connect(pump.port_b, leg1.port_a) annotation(
    Line(points = {{-28, -108}, {-8, -108}}, color = {0, 127, 255}));
  connect(volume.ports[1], pump.port_a) annotation(
    Line(points = {{-122, -110}, {-48, -110}, {-48, -108}}, color = {0, 127, 255}));
  connect(leg2.port_b, leg3.port_a) annotation(
    Line(points = {{56, -108}, {80, -108}}));
  connect(fixedTemperature.port, convection.fluid) annotation(
    Line(points = {{150, -26}, {150, -40}}, color = {191, 0, 0}));
  connect(const1.y, convection.Gc) annotation(
    Line(points = {{129, -50}, {139, -50}}, color = {0, 0, 127}));
  connect(convection.solid, leg3.heatPorts[1]) annotation(
    Line(points = {{150, -60}, {150, -88}, {90, -88}, {90, -104}}, color = {191, 0, 0}));
  connect(cellStack.heatPort, leg1.heatPorts[1]) annotation(
    Line(points = {{-56, 178}, {-58, 178}, {-58, -82}, {2, -82}, {2, -104}}, color = {191, 0, 0}));
  connect(thermalCollector.port_a[6], imc.thermalPort.heatPortRotorWinding) annotation(
    Line(points = {{80, -42}, {80, 2}}, color = {191, 0, 0}));
  connect(thermalCollector.port_a[4], imc.thermalPort.heatPortStrayLoad) annotation(
    Line(points = {{80, -42}, {80, 2}}, color = {191, 0, 0}));
  connect(thermalCollector.port_a[3], imc.thermalPort.heatPortStatorCore) annotation(
    Line(points = {{80, -42}, {80, 2}}, color = {191, 0, 0}));
  connect(thermalCollector.port_a[2], imc.thermalPort.heatPortRotorCore) annotation(
    Line(points = {{80, -42}, {80, 2}}, color = {191, 0, 0}));
  connect(thermalCollector.port_a[1], imc.thermalPort.heatPortFriction) annotation(
    Line(points = {{80, -42}, {80, 2}}, color = {191, 0, 0}));
  connect(statorWinding.port_a[1:3], imc.thermalPort.heatPortStatorWinding) annotation(
    Line(points = {{80, -10}, {80, 2}}, color = {191, 0, 0}));
  connect(thermalCollector.port_a[5], statorWinding.port_b) annotation(
    Line(points = {{80, -42}, {80, -30}}, color = {191, 0, 0}));
  connect(thermalCollector.port_b, leg2.heatPorts[1]) annotation(
    Line(points = {{80, -62}, {46, -62}, {46, -104}}, color = {191, 0, 0}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(coordinateSystem(extent = {{-1000, -1000}, {1000, 1000}})),
    Icon(coordinateSystem(extent = {{-1000, -1000}, {1000, 1000}})),
    version = "",
    __OpenModelica_simulationFlags(d = "bltdump", lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
    experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-06, Interval = 0.02));
end testbedModel_v010;