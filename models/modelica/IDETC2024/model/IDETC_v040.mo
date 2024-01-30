model IDETC_v040
  CellStackTC_adapted stack1(RUL(fixed = true, start = 1), SOCini = 1, cellParameters = cellParams, np = 12, ns = 96)  annotation(
    Placement(transformation(origin = {-118, 404}, extent = {{10, -10}, {-10, 10}})));
  CellStackTC_adapted stack2(RUL(fixed = true, start = 1), SOCini = 1, cellParameters = cellParams, np = 12, ns = 96)  annotation(
    Placement(visible = true, transformation(origin = {-118, 356}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalCurrent load1 annotation(
    Placement(visible = true, transformation(origin = {-194, 402}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Sources.SignalCurrent load2 annotation(
    Placement(visible = true, transformation(origin = {-194, 354}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  dividingmodel loadsplitter annotation(
    Placement(visible = true, transformation(origin = {-254, 376}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = 7.8, falling = 200, period = 6000, rising = 200, width = 5400)  annotation(
    Placement(visible = true, transformation(origin = {-290, 354}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter ElectricalEnergyStorage.CellRecords.StaticResistance.StaticResistanceParameters cellParams(Rs = ElectricalEnergyStorage.CellRecords.Components.Resistance(R0 = 0.0233200891626921),SOCOCV = ElectricalEnergyStorage.CellRecords.Components.SOCOCV(OCVtableOnFile = true, OCVtableName = "26650SOCvOVC", OCVfileName = "/media/nate/External/loadSharing/26650SOCvOCV_old.csv"), capacity = ElectricalEnergyStorage.CellRecords.Components.ChargeCapacity(C0 = 9360))  annotation(
    Placement(visible = true, transformation(origin = {-112, 380}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-204, 380}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.MultiSensor meter1 annotation(
    Placement(visible = true, transformation(origin = {-160, 404}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.MultiSensor meter2 annotation(
    Placement(visible = true, transformation(origin = {-160, 354}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor comboVoltage annotation(
    Placement(visible = true, transformation(origin = {-80, 380}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  PowerSystems.AC1ph_DC.Sources.DCvoltage DCVoltage(V_nom = 100, pol = 0, puUnits = true, use_vDC_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-52, 344}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.AC1ph_DC.Sensors.PVImeter DCmeter(S_nom = 1000, V_nom = 100, av = false, puUnits = true, tcst = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-20, 344}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.AC3ph.Inverters.InverterAverage inverter(redeclare record Data = PowerSystems.Examples.Data.Semiconductors.IdealSC100V_10A)  annotation(
    Placement(visible = true, transformation(origin = {12, 344}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.AC3ph.Sensors.PVImeter ACmeter(S_nom = 1000, V_nom = 100, abc = true, av = false, puUnits = true, tcst = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {44, 344}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.Common.Thermal.BdCondV bdCond annotation(
    Placement(visible = true, transformation(origin = {12, 364}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.AC3ph.Inverters.Select select(use_vPhasor_in = true)  annotation(
    Placement(visible = true, transformation(origin = {12, 378}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.Blocks.Signals.TransientPhasor vCtrl(ph_end = 0.5235987755983001, t_change = 0.1, t_duration = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-20, 406}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PowerSystems.System system(dynType = PowerSystems.Types.Dynamics.FixedInitial)  annotation(
    Placement(visible = true, transformation(origin = {-20, 376}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.Common.Thermal.BoundaryV boundary(m = 2)  annotation(
    Placement(visible = true, transformation(origin = {74, 368}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.Mechanics.Rotational.Rotor rotor(J = 0.0932)  annotation(
    Placement(visible = true, transformation(origin = {102, 344}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.AC3ph.Machines.Synchron3rd_pm motor(redeclare record Data = PowerSystems.Examples.Data.Machines.Synchron3rd_pm400V_30kVA)  annotation(
    Placement(visible = true, transformation(origin = {74, 344}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  stack1.staticResistance.cellCalculator.SOC = loadsplitter.SOC1;
  stack2.staticResistance.cellCalculator.SOC = loadsplitter.SOC2;
  stack1.RUL = loadsplitter.RUL1;
  stack2.RUL = loadsplitter.RUL2;
  load1.i = if trapezoid.y > 0 then loadsplitter.Bat1Load else -78;
  load2.i = if trapezoid.y > 0 then loadsplitter.Bat2Load else -78;
  DCVoltage.vDC_in = if trapezoid.y > 0 then comboVoltage.v else 0;
  connect(trapezoid.y, loadsplitter.Load) annotation(
    Line(points = {{-278, 354}, {-256, 354}, {-256, 368}}, color = {0, 0, 127}));
  connect(meter1.nc, stack1.pin_pStack) annotation(
    Line(points = {{-150, 404}, {-144, 404}, {-144, 418}, {-118, 418}, {-118, 414}}, color = {0, 0, 255}));
  connect(meter1.pv, stack1.pin_pStack) annotation(
    Line(points = {{-160, 414}, {-160, 418}, {-118, 418}, {-118, 414}}, color = {0, 0, 255}));
  connect(meter1.nv, stack1.pin_nStack) annotation(
    Line(points = {{-160, 394}, {-160, 386}, {-118, 386}, {-118, 394}}, color = {0, 0, 255}));
  connect(meter2.nc, stack2.pin_pStack) annotation(
    Line(points = {{-150, 354}, {-140, 354}, {-140, 370}, {-118, 370}, {-118, 366}}, color = {0, 0, 255}));
  connect(meter2.pv, stack2.pin_pStack) annotation(
    Line(points = {{-160, 364}, {-160, 370}, {-118, 370}, {-118, 366}}, color = {0, 0, 255}));
  connect(meter2.nv, stack2.pin_nStack) annotation(
    Line(points = {{-160, 344}, {-160, 338}, {-118, 338}, {-118, 346}}, color = {0, 0, 255}));
  connect(load2.n, stack2.pin_nStack) annotation(
    Line(points = {{-194, 344}, {-194, 338}, {-118, 338}, {-118, 346}}, color = {0, 0, 255}));
  connect(load2.p, ground.p) annotation(
    Line(points = {{-194, 364}, {-194, 380}}, color = {0, 0, 255}));
  connect(load1.n, ground.p) annotation(
    Line(points = {{-194, 392}, {-194, 380}}, color = {0, 0, 255}));
  connect(load2.p, meter2.pc) annotation(
    Line(points = {{-194, 364}, {-194, 370}, {-180, 370}, {-180, 354}, {-170, 354}}, color = {0, 0, 255}));
  connect(load1.p, meter1.pc) annotation(
    Line(points = {{-194, 412}, {-194, 418}, {-180, 418}, {-180, 404}, {-170, 404}}, color = {0, 0, 255}));
  connect(stack1.pin_nStack, load1.n) annotation(
    Line(points = {{-118, 394}, {-118, 386}, {-194, 386}, {-194, 392}}, color = {0, 0, 255}));
  connect(comboVoltage.p, stack1.pin_pStack) annotation(
    Line(points = {{-80, 390}, {-80, 418}, {-118, 418}, {-118, 414}}, color = {0, 0, 255}));
  connect(comboVoltage.n, stack2.pin_nStack) annotation(
    Line(points = {{-80, 370}, {-80, 338}, {-118, 338}, {-118, 346}}, color = {0, 0, 255}));
  connect(DCmeter.term_p, DCVoltage.term) annotation(
    Line(points = {{-30, 344}, {-42, 344}}));
  connect(DCmeter.term_n, inverter.DC) annotation(
    Line(points = {{-10, 344}, {2, 344}}, color = {0, 0, 255}));
  connect(ACmeter.term_p, inverter.AC) annotation(
    Line(points = {{34, 344}, {22, 344}}, color = {0, 120, 120}));
  connect(bdCond.heat, inverter.heat) annotation(
    Line(points = {{12, 354}, {12, 354}}, color = {176, 0, 0}));
  connect(select.theta_out, inverter.theta) annotation(
    Line(points = {{6, 368}, {6, 354}}, color = {0, 0, 127}));
  connect(select.vPhasor_out, inverter.vPhasor) annotation(
    Line(points = {{18, 368}, {18, 354}}, color = {0, 0, 127}, thickness = 0.5));
  connect(vCtrl.y, select.vPhasor_in) annotation(
    Line(points = {{-10, 406}, {18, 406}, {18, 388}}, color = {0, 0, 127}, thickness = 0.5));
//connect(comboVoltage.v, DCVoltage.vDC_in) annotation(
//Line(points = {{-68, 380}, {-46, 380}, {-46, 354}}, color = {0, 0, 127}));
  connect(motor.term, ACmeter.term_n) annotation(
    Line(points = {{64, 344}, {54, 344}}));
  connect(boundary.heat, motor.heat) annotation(
    Line(points = {{74, 358}, {74, 354}}, color = {176, 0, 0}));
  connect(rotor.flange_a, motor.airgap) annotation(
    Line(points = {{92, 344}, {88, 344}, {88, 350}, {74, 350}}));
  annotation(
    uses(ElectricalEnergyStorage(version = "3.2.2"), Modelica(version = "3.2.3"), PowerSystems(version = "1.0.1")),
    Diagram(coordinateSystem(extent = {{-1000, -1000}, {1000, 1000}})),
    Icon(coordinateSystem(extent = {{-1000, -1000}, {1000, 1000}})),
    version = "");
end IDETC_v040;