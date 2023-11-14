model CustomPulse

  parameter Real pulseWidth = 1; // Width of each pulse
  parameter Real waitTime = 1; // Time between pulses
  parameter Integer nRepeats = 1; // Number of repetitions
  parameter Real amplitude = 1; // Amplitude of the pulse

  Real currentTime(start=0);
  Real pulseValue(start=0); // Output pulse value
  Integer pulseCount(start=0); // Counter for the number of pulses
  Boolean isPositivePulse(start=true);
  // Flag to alternate pulse sign
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0))); 
    
  algorithm
  currentTime := time;

  // Logic for pulse generation
  when sample(0, pulseWidth + waitTime) and pulseCount < (nRepeats*2) then
    // Alternate pulse sign and generate pulse
    if isPositivePulse then
      pulseValue := amplitude;
      y := pulseValue;
    else
      pulseValue := -amplitude;
      y := pulseValue;
    end if;

    // Increment pulse counter and toggle pulse sign after each pulse
    pulseCount := pulseCount + 1;
    isPositivePulse := not isPositivePulse;
  elsewhen sample(pulseWidth, pulseWidth + waitTime) then
    // Set pulse to zero during wait time
    pulseValue := 0;
    y := pulseValue;
  end when;


annotation(
    uses(Modelica(version = "4.0.0")));
end CustomPulse;
