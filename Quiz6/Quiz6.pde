void setup() {
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos() {
  
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw() {
  background(20); // Darker background makes the glow pop
  
  PVector mouse = mousePos();
  
  
  PVector bladeSideA = mouse.copy().normalize().mult(300);
  PVector bladeSideB = mouse.copy().normalize().mult(-300); 

 
  strokeWeight(25);
  stroke(255, 0, 0, 150);
  line(bladeSideB.x, bladeSideB.y, bladeSideA.x, bladeSideA.y);

 
  strokeWeight(8);
  stroke(255); // Solid White
  line(bladeSideB.x, bladeSideB.y, bladeSideA.x, bladeSideA.y);

  
 
  PVector handleStart = mouse.copy().normalize().mult(-40);
  PVector handleEnd = mouse.copy().normalize().mult(40);
  strokeWeight(15);
  stroke(0); 
  line(handleStart.x, handleStart.y, handleEnd.x, handleEnd.y);
  

  println("Blade Side Magnitude: " + bladeSideA.mag());
}
