Walker bounceWalker;

void setup() {
  size(1020, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  bounceWalker = new Walker();
}

void draw() {
  background(255); 
  
  bounceWalker.moveAndBounce();
  bounceWalker.render();
}
