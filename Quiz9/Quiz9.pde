Walker[] walkers = new Walker[8];
PVector rightForce = new PVector(0.2, 0);

void setup() {
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initWalkers();
}

void initWalkers() {
  for (int i = 0; i < walkers.length; i++) {
    int n = i + 1; // n starts at 1 for the equation
    
    // Equation: posY = (Window Height / number of walkers) * (n - (number of walkers / 2 + 0.5))
    // Note: I added + 0.5 to balance the distribution perfectly across the center
    float posY = (Window.windowHeight / (float)walkers.length) * (n - (walkers.length / 2.0f + 0.5f));
    
    walkers[i] = new Walker();
    walkers[i].mass = n; 
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].position = new PVector(Window.left + 50, posY); // Start at left
    walkers[i].c = color(random(255), random(255), random(255));
    walkers[i].velocity = new PVector(0, 0); // Reset velocity
  }
}

void mouseClicked() {
  initWalkers(); // Reset everything when mouse is clicked
}

void draw() {
  background(80);
  
  // Draw midpoint line for visual reference
  stroke(255, 50);
  line(0, Window.top, 0, Window.bottom);

  for (Walker w : walkers) {
    // 1. Friction Logic: Friction = -1 * mew * N * v_unit
    float mew = 0.01f; // Initial coefficient
    
    // If beyond the middle (x > 0), increase friction to 0.4f
    if (w.position.x > 0) {
      mew = 0.4f;
    }
    
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    
    w.applyForce(friction);
    w.applyForce(rightForce);
    
    w.update();
    w.bounce();
    w.render();
  }
}
