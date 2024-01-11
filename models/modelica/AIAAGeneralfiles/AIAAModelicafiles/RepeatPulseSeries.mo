model RepeatPulseSeries
  Modelica.Blocks.Sources.SawTooth sawTooth(amplitude=1, offset=0, period=240); // Frequency is the inverse of the period (4 minutes)
  Modelica.Electrical.Batteries.Utilities.PulseSeries pulseseries(n1=1, T1=60, n2=1, Tp=60);
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Real currentTime(start=0);

algorithm
    currentTime := time;

    // Logic to repeat the signal every time the sawTooth resets
    when sawTooth.y >= 1 then
        // Logic to reset or repeat the original signal
        pulseseries.startTime := currentTime;
    end when;
annotation(
    uses(Modelica(version = "4.0.0")));
end RepeatPulseSeries;
