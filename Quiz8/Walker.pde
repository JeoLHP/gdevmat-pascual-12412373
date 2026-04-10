public class Walker {
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 15;
  public float scale = 15;
  public float mass = 1;
  public color c;
  
  public Walker() {}
  
  public void applyForce(PVector force) {
    // Newton's 2nd Law: A = F / M
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); 
  }
  
  public void update() {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // Reset acceleration for the next frame
  }
  
  public void render() {
    fill(c);
    noStroke();
    circle(position.x, position.y, scale);
  }
  
  public void bounceEdges() {
    // Horizontal bounce
    if (this.position.x + (scale/2) > Window.right) {
      this.position.x = Window.right - (scale/2);
      this.velocity.x *= -1; // Reverse direction
    } else if (this.position.x - (scale/2) < Window.left) {
      this.position.x = Window.left + (scale/2);
      this.velocity.x *= -1;
    }
    
    // Vertical bounce
    if (this.position.y + (scale/2) > Window.top) {
      this.position.y = Window.top - (scale/2);
      this.velocity.y *= -1;
    } else if (this.position.y - (scale/2) < Window.bottom) {
      this.position.y = Window.bottom + (scale/2);
      this.velocity.y *= -1;
    }
  }
}
