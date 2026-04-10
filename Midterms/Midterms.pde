Mover[] matters = new Mover[100];
Mover blackHole;
int resetTimer = 300;

void setup()
{
  size(1920, 1080, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  blackHole = new Mover(random(Window.left, Window.right), random(Window.bottom, Window.top), 50);
  blackHole.setColor(255, 255, 255, 255);
  initializeMatters();
}

void initializeMatters()
{
  for (int i = 0; i < matters.length; i++)
  {
    float x = randomGaussian() * 200; 
    float y = randomGaussian() * 200;
    
    float randomScale = random(10, 30);
    matters[i] = new Mover(x, y, randomScale);
    matters[i].setColor(random(255), random(255), random(255), random(100, 200));
  }
}

void draw()
{
  background(0);
  
  blackHole.position.x = mouseX - (width/2);
  blackHole.position.y = -(mouseY - (height/2));
  
  blackHole.render();
  
  for (int i = 0; i < matters.length; i++)
  {
    PVector direction = PVector.sub(blackHole.position, matters[i].position);
    
    if (direction.mag() > 5) 
    {
      direction.normalize();
      matters[i].position.add(direction.mult(5));
    }
    else 
    {
      matters[i].position.set(5000, 5000); 
    }
    
    matters[i].render();
  }
  
  if (frameCount % resetTimer == 0)
  {
    blackHole.position.set(random(Window.left, Window.right), random(Window.bottom, Window.top));
    initializeMatters();
  }
}
