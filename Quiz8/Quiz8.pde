// Declare the array of 10 Walkers
Walker[] walkers = new Walker[10];

// Declare and initialize the two forces
PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.15, 0);

void setup() {
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Initialize the array in a loop
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    
    // Each walker gets a mass from 1 to 10
    walkers[i].mass = i + 1;
    
    // Scale depends on mass (mass * 15)
    walkers[i].scale = walkers[i].mass * 15;
    
    // Set start position to (-500, 200)
    walkers[i].position = new PVector(-500, 200);
    
    // Random color (using the random colors logic discussed earlier)
    walkers[i].c = color(random(255), random(255), random(255));
  }
}

void draw() {
  background(80);
  
  for (int i = 0; i < walkers.length; i++) {
    // Apply both forces to the walkers
    walkers[i].applyForce(gravity);
    walkers[i].applyForce(wind);
    
    // Update physics and handle the bounce
    walkers[i].update();
    walkers[i].bounceEdges(); 
    walkers[i].render();
  }
}
