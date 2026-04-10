public class Walker {
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  public Walker() {}
  
  public void update(PVector target) {
    // 1. Get direction: Target - Current Position
    PVector direction = PVector.sub(target, this.position);
    
    // 2. Normalize: Keep direction, set length to 1
    direction.normalize();
    
    // 3. Assign and scale: Multiply by 0.2
    this.acceleration = direction.mult(0.2f);
    
    // Standard physics motion
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  public void render() {
    noStroke();
    fill(255, 200); // Semi-transparent white
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges() {
    if (this.position.x > Window.right) this.position.x = Window.left;
    else if (this.position.x < Window.left) this.position.x = Window.right;
    
    if (this.position.y > Window.top) this.position.y = Window.bottom;
    else if (this.position.y < Window.bottom) this.position.y = Window.top;
  }
}
