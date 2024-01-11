model TimedOutput

  Real output1;
  parameter Real durations[63] = {30, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 300}; // durations in seconds
  parameter Real values[63] = {500, 250, 247.9166667, 245.8333333, 243.75, 241.6666667, 239.5833333, 237.5, 235.4166667, 233.3333333, 231.25, 229.1666667, 227.0833333, 225, 222.9166667, 220.8333333, 218.75, 216.6666667, 214.5833333, 212.5, 210.4166667, 208.3333333, 206.25, 204.1666667, 202.0833333, 200, 197.9166667, 195.8333333, 193.75, 191.6666667, 189.5833333, 187.5, 185.4166667, 183.3333333, 181.25, 179.1666667, 177.0833333, 175, 172.9166667, 170.8333333, 168.75, 166.6666667, 164.5833333, 162.5, 160.4166667, 158.3333333, 156.25, 154.1666667, 152.0833333, 150, 147.9166667, 145.8333333, 143.75, 141.6666667, 139.5833333, 137.5, 135.4166667, 133.3333333, 131.25, 129.1666667, 127.0833333, 125, 425}; // corresponding values

protected
  Real accumulatedTime;
  Integer index;

algorithm 
  // Accumulate time and find the current index
  while accumulatedTime <= time and index <= size(durations, 1) loop
    accumulatedTime := accumulatedTime + durations[index];
    if time < accumulatedTime then
      output1 := values[index];
      break;
    end if;
    index := index + 1;
  end while;

  // Handling the case where time exceeds all durations
  if time >= accumulatedTime then
    output1 := 0; // or any other final value
  end if;


//  Real output1;
//  parameter Real durations[63] = {30, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 300}; // durations in seconds
//  parameter Real values[63] = {500, 250, 247.9166667, 245.8333333, 243.75, 241.6666667, 239.5833333, 237.5, 235.4166667, 233.3333333, 231.25, 229.1666667, 227.0833333, 225, 222.9166667, 220.8333333, 218.75, 216.6666667, 214.5833333, 212.5, 210.4166667, 208.3333333, 206.25, 204.1666667, 202.0833333, 200, 197.9166667, 195.8333333, 193.75, 191.6666667, 189.5833333, 187.5, 185.4166667, 183.3333333, 181.25, 179.1666667, 177.0833333, 175, 172.9166667, 170.8333333, 168.75, 166.6666667, 164.5833333, 162.5, 160.4166667, 158.3333333, 156.25, 154.1666667, 152.0833333, 150, 147.9166667, 145.8333333, 143.75, 141.6666667, 139.5833333, 137.5, 135.4166667, 133.3333333, 131.25, 129.1666667, 127.0833333, 125, 425}; // corresponding values
//  parameter Integer numRepetitions = 5; // Number of times to repeat the pulse sequence
//  parameter Real negativePulseDuration = 100; // Duration of the negative pulse
//  parameter Real negativePulseValue = -100; // Value of the negative pulse

//protected
//  Real accumulatedTime(start = 0);
//  Integer index(start = 1);
//  Real totalDuration = sum(durations) + negativePulseDuration; // Total duration of one full sequence
//  Integer repetitionCounter(start = 0); // Counter for the number of repetitions

//algorithm 
//  while repetitionCounter < numRepetitions loop
//    // Reset for each repetition
//    accumulatedTime := repetitionCounter * totalDuration;
//    index := 1;
    
//    // Generate positive pulse
//    while accumulatedTime <= time and index <= size(durations, 1) loop
//      accumulatedTime := accumulatedTime + durations[index];
//      if time < accumulatedTime then
//        output1 := values[index];
//        break;
//      end if;
//      index := index + 1;
//    end while;

//    // Generate negative pulse
//    if time >= accumulatedTime and time < accumulatedTime + negativePulseDuration then
//      output1 := negativePulseValue;
//    end if;

//    // Increment the repetition counter
//    if time >= accumulatedTime + negativePulseDuration then
//      repetitionCounter := repetitionCounter + 1;
//    end if;
//  end while;

//  // Default output after all repetitions
//  if time >= repetitionCounter * totalDuration then
//    output1 := 0;
//  end if;

end TimedOutput;
