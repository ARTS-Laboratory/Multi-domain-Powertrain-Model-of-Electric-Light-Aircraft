// Originally written by George Anthony for the AIAA conference paper, adapted to work with Modelica 3.2.2
model CellStackTC_adapted "Battery with open-circuit voltage dependent on state of charge, self-discharge and inner resistance"
  extends ElectricalEnergyStorage.Batteries.Stacks.WithMeasurement.StaticResistanceScaled;
  Real totalCharge(start=0);
  output Real totalCurrent;
  output Real RUL_End;
  parameter Real RUL_Start = 1;
  parameter Real CycleLife = 10;
  parameter Real Capacity = cellParameters.capacity.C0;
  Real AdjustedCapacity;
  Real AgingFactor;
  Real RUL(start=RUL_Start, min=0, max=1);
equation
  der(totalCharge) = abs(cellMeasurement.i);  // Assuming 'i' is the current through the battery measured in A/s
  totalCurrent = totalCharge / 3600; //Converting Total current to A/h
  AgingFactor = 1 / (np * Capacity * 2 / 3600 * CycleLife);
  AdjustedCapacity = (np * Capacity / 3600) * (RUL * .2 + .8);
  RUL = RUL_Start - (AgingFactor * totalCurrent);
  RUL_End = RUL;
end CellStackTC_adapted;