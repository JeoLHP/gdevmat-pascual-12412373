public class Walker {
  public float x, y;
  
  
  public float tx = 0;
  public float ty = 10000;
  public float tScale = 20000;
  public float tr = 30000;
  public float tg = 40000;
  public float tb = 50000;
  
  void render() {
    
    float thickness = map(noise(tScale), 0, 1, 5, 150);
    
    
    float r = map(noise(tr), 0, 1, 0, 255);
    float g = map(noise(tg), 0, 1, 0, 255);
    float b = map(noise(tb), 0, 1, 0, 255);
    
    fill(r, g, b, 255); 
    noStroke();
    circle(x, y, thickness);
  }
  
  void perlinWalk() {
    
    x = map(noise(tx), 0, 1, -510, 510);
    y = map(noise(ty), 0, 1, -360, 360);
    
   
  
    tx += 0.005;
    ty += 0.005;
    tScale += 0.005;
    tr += 0.005;
    tg += 0.005;
    tb += 0.005;
  }
}
