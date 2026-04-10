public class Walker {
  
  PVector position;
  PVector speed;
  
  
  public float tScale = 20000;
  public float tr = 30000;
  public float tg = 40000;
  public float tb = 50000;

  Walker() {
    position = new PVector(0, 0); 
    speed = new PVector(5, 8);    
  }

  void render() {
    float thickness = map(noise(tScale), 0, 1, 5, 150);
    
    float r = map(noise(tr), 0, 1, 0, 255);
    float g = map(noise(tg), 0, 1, 0, 255);
    float b = map(noise(tb), 0, 1, 0, 255);
    
    fill(r, g, b);
    noStroke();
 
    circle(position.x, position.y, thickness);
    
   
    tScale += 0.01f;
    tr += 0.01f;
    tg += 0.01f;
    tb += 0.01f;
  }

  void moveAndBounce() {
   
    position.add(speed);

   
    if ((position.x > Window.right) || (position.x < Window.left)) {
      speed.x *= -1;
    }
    
    if ((position.y > Window.top) || (position.y < Window.bottom)) {
      speed.y *= -1;
    }
  }
}
