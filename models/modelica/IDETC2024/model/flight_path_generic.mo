model flight_path_generic

  parameter Real rotor_speed=1800; // Rotor speed in rpm
  parameter Real ascent_time=60;
  parameter Real descent_time=60;
  parameter Real cruise_time=600;
  /*Real currentTime(start=0);*/ // The current time
  //Real pulseValue(start=0); // Output pulse value
  //Integer pulseCount(start=0); // Counter for the number of pulses
  
  // Output node
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  y = (if time < ascent_time then time*rotor_speed/ascent_time else if time<cruise_time+ascent_time then rotor_speed else rotor_speed+(600+ascent_time-time)*rotor_speed/descent_time);
  
//  algorithm
//    currentTime:=time;

//  when sample(0,720) then
//    if(time<60) then
//      y:=(time)*30;
//    elseif(time<660) then
//      y:=1800;
//    else
//      y:=(660-time)*30;
//    end if;
//  end when;

end flight_path_generic;