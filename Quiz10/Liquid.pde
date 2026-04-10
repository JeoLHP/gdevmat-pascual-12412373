public class Liquid {
  public float x, y, horizon, depth, cd;

  public Liquid(float x, float y, float horizon, float depth, float cd) {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.cd = cd;
  }

  public void render() {
    noStroke();
    fill(28, 120, 186, 200); // Added alpha for transparency
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    endShape();
  }

  public boolean isCollidingWith(Walker walker) {
    PVector pos = walker.position;
    // Check if the walker's position is within the liquid's horizontal and vertical bounds
    return pos.x > this.x - this.horizon && 
           pos.x < this.x + this.horizon && 
           pos.y < this.y;
  }

  public PVector calculateDragForce(Walker walker) {
    // Drag magnitude: Cd * speed^2
    float speed = walker.velocity.mag();
    float dragMagnitude = this.cd * speed * speed;

    // Direction: Inverse of velocity
    PVector dragForce = walker.velocity.copy();
    dragForce.mult(-1);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);

    return dragForce;
  }
}
