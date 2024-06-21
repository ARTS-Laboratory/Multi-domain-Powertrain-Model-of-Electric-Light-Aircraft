model hybridFC_v001
  PowerSystems.AC1ph_DC.Sources.DCvoltage voltage1(pol = 0, puUnits = false, use_vDC_in = true) annotation(
    Placement(visible = true, transformation(origin = {-56, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.AC1ph_DC.Nodes.GroundOne ground annotation(
    Placement(visible = true, transformation(origin = {-88, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PowerSystems.AC1ph_DC.Sensors.PVImeter DCMeter(puUnits = false) annotation(
    Placement(visible = true, transformation(origin = {-26, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Fuel_Cell.Fuel_Cell_Simpilified_Electrical_Model fc annotation(
    Placement(visible = true, transformation(origin = {-56, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.AC3ph.Inverters.InverterAverage inverter(redeclare record Data = PowerSystems.Examples.Data.Semiconductors.IdealSC100V_10A) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.Common.Thermal.BdCondV bdCond annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.AC3ph.Inverters.Select select annotation(
    Placement(visible = true, transformation(origin = {0, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.Blocks.Signals.TransientPhasor phasor annotation(
    Placement(visible = true, transformation(origin = {-22, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PowerSystems.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.AC3ph.Sensors.PVImeter ACMeter(puUnits = false) annotation(
    Placement(visible = true, transformation(origin = {28, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerSystems.AC3ph.Sources.PQsource pQsource1(pq0 = {10000, 0}, puUnits = false, use_pq_in = true) annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_up(duration = 30, height = -9900, offset = -100, startTime = 600)  annotation(
    Placement(visible = true, transformation(origin = {38, 66}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Sources.Step step(height = 4000, startTime = 690)  annotation(
    Placement(visible = true, transformation(origin = {54, 80}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Math.Add3 add annotation(
    Placement(visible = true, transformation(origin = {54, 26}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_down(duration = 30, height = 5900, startTime = 3090)  annotation(
    Placement(visible = true, transformation(origin = {70, 68}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
equation
  // Piecewise definition of i_FC
  if time == 0 then
    fc.i_FC = fc.epsilon;
  else
    fc.i_FC = DCMeter.i;
  end if;
  
  voltage1.vDC_in = fc.v_FC;
  
  connect(ground.term, voltage1.neutral) annotation(
    Line(points = {{-78, 0}, {-66, 0}}, color = {0, 0, 255}));
  connect(voltage1.term, DCMeter.term_p) annotation(
    Line(points = {{-46, 0}, {-36, 0}}, color = {0, 0, 255}));
  connect(DCMeter.term_n, inverter.DC) annotation(
    Line(points = {{-16, 0}, {-10, 0}}, color = {0, 0, 255}));
  connect(bdCond.heat, inverter.heat) annotation(
    Line(points = {{0, 10}, {0, 10}}, color = {176, 0, 0}));
  connect(select.theta_out, inverter.theta) annotation(
    Line(points = {{-6, 22}, {-6, 10}}, color = {0, 0, 127}));
  connect(select.vPhasor_out, inverter.vPhasor) annotation(
    Line(points = {{6, 22}, {6, 10}}, color = {0, 0, 127}, thickness = 0.5));
  connect(phasor.y, select.vPhasor_in) annotation(
    Line(points = {{-12, 60}, {6, 60}, {6, 42}}, color = {0, 0, 127}, thickness = 0.5));
  connect(ACMeter.term_p, inverter.AC) annotation(
    Line(points = {{18, 0}, {10, 0}}, color = {0, 120, 120}));
  connect(pQsource1.term, ACMeter.term_n) annotation(
    Line(points = {{50, 0}, {38, 0}}, color = {0, 120, 120}));
  pQsource1.pq_in[2] = 0;
  connect(pQsource1.pq_in[1], add.y) annotation(
    Line(points = {{54, 10}, {54, 16}}, color = {0, 0, 127}));
  connect(ramp_down.y, add.u1) annotation(
    Line(points = {{70, 62}, {70, 50}, {62, 50}, {62, 38}}, color = {0, 0, 127}));
  connect(step.y, add.u2) annotation(
    Line(points = {{54, 74}, {54, 38}}, color = {0, 0, 127}));
  connect(ramp_up.y, add.u3) annotation(
    Line(points = {{38, 60}, {38, 52}, {46, 52}, {46, 38}}, color = {0, 0, 127}));
  annotation(
    uses(PowerSystems(version = "1.0.1"), Modelica(version = "3.2.3")),
    Diagram);
end hybridFC_v001;