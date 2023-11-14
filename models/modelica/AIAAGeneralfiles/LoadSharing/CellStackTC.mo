model CellStackTC "Battery with open-circuit voltage dependent on state of charge, self-discharge and inner resistance"
  extends Modelica.Electrical.Batteries.BaseClasses.BaseCellStack(r0(final R = Ns*cellData.Ri/Np), redeclare Modelica.Electrical.Batteries.ParameterRecords.CellData cellData);
  Real totalCharge(start=0);
  output Real totalCurrent;
  output Real RUL_End;
  parameter Real RUL_Start = 1;
  parameter Real CycleLife = 10;
  parameter Real Capacity = cellData.Qnom;
  Real AdjustedCapacity;
  Real AgingFactor;
  Real RUL(start=RUL_Start, min=0, max=1);
equation
  der(totalCharge) = abs(i);  // Assuming 'i' is the current through the battery measured in A/s
  totalCurrent = totalCharge / 3600; //Converting Total current to A/h
  AgingFactor = 1 / (Np * Capacity / 3600 * CycleLife);
  AdjustedCapacity = (Np * Capacity / 3600) * (RUL * .2 + .8);
  RUL = RUL_Start - (AgingFactor * totalCurrent);
  RUL_End = RUL;
  connect(r0.n, n) annotation(
    Line(points = {{10, 0}, {100, 0}}, color = {0, 0, 255}));
  annotation(
    Documentation(info = "<html>
<p>
The battery is modeled by open-circuit voltage (OCV) dependent on state of charge (SOC), self-discharge and inner resistance,
as implemented in partial <a href=\"modelica://Modelica.Electrical.Batteries.BaseClasses.BaseCellStack\">BaseCellStack</a>.
</p>
<p>
This model can be used for a single cell <code>Ns = Np = 1</code> as well as a stack built from identical cells.
</p>
<p>
For details, see <a href=\"modelica://Modelica.Electrical.Batteries.UsersGuide.Concept\">concept</a> and <a href=\"modelica://Modelica.Electrical.Batteries.UsersGuide.Parameterization\">parameterization</a>.
</p>
<h4>Note</h4>
<p>
Parameter record array <a href=\"modelica://Modelica.Electrical.Batteries.ParameterRecords.TransientData.RCData\">rcData</a> contained in
parameter record <a href=\"modelica://Modelica.Electrical.Batteries.ParameterRecords.CellData\">cellData</a> is neglected.
</p>
</html>"));
end CellStackTC;
