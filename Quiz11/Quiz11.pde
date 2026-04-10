Walker[] walkers = new Walker[10];

void setup() {
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    
    // Random position within window bounds
    walkers[i].position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    
    // Random mass (5 to 15) and scale (mass * 10)
    walkers[i].mass = random(5, 15);
    walkers[i].scale = walkers[i].mass * 10;
    
    // Random colors
    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
    walkers[i].a = 200; // Slightly transparent
  }
}

void draw() {
  background(255);
  
  // Nested loops to compute mutual attraction
  for (int i = 0; i < walkers.length; i++) {
    for (int j = 0; j < walkers.length; j++) {
      if (i != j) { // Don't attract yourself!
        PVector force = walkers[j].calculateAttraction(walkers[i]);
        walkers[i].applyForce(force);
      }
    }
    
    // Update and render after all forces are applied
    walkers[i].update();
    walkers[i].render();
  }
}
