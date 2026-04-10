Walker[] walkers = new Walker[10];
Liquid ocean;
PVector wind = new PVector(0.1, 0);

void setup() {
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Initialize Liquid: (x, y, horizon, depth, coefficient of drag)
  ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
  
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    
    // 1. Spaced out side-by-side: 
    // Divide window width by 10 and center them
    float spacing = (float)Window.widthPx / walkers.length;
    float posX = Window.left + (spacing * i) + (spacing / 2);
    
    // 2. Positioned slightly ABOVE the screen (e.g., y = 400)
    walkers[i].position = new PVector(posX, 400);
    
    // 3. Random mass and colors
    walkers[i].mass = random(1, 8);
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
  }
}

void draw() {
  background(255);
  
  ocean.render();
  
  for (Walker w : walkers) {
    // Force 1: Wind
    w.applyForce(wind);
    
    // Force 2: Gravity scaled by mass
    PVector gravity = new PVector(0, -0.15f * w.mass);
    w.applyForce(gravity);
    
    // Force 3: Drag Force (only if colliding with liquid)
    if (ocean.isCollidingWith(w)) {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
    
    w.update();
    w.bounce();
    w.render();
  }
}
