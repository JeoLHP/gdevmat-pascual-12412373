// Array to hold 100 walkers
Walker[] walkers = new Walker[100];

void setup() {
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Initialize each walker with random values
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    // Random position within window bounds
    walkers[i].position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    // Random scale between 10 and 50
    walkers[i].scale = random(10, 50);
  }
}

// Function to get mouse position adjusted for our centered camera
PVector getMouse() {
  return new PVector(mouseX - Window.w, -(mouseY - Window.h));
}

void draw() {
  background(80);
  
  PVector mouse = getMouse();
  
  for (Walker w : walkers) {
    w.update(mouse); // Pass mouse position to the update function
    w.checkEdges();
    w.render();
  }
}
