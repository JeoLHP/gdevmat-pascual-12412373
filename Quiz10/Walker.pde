public class Walker {
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float velocityLimit = 15;
  public float scale = 15;
  public float mass = 1;
  public float r, g, b, a = 255;

  public Walker() {}

  public void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  public void update() {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // Reset acceleration
  }

  public void render() {
    fill(r, g, b, a);
    noStroke();
    circle(position.x, position.y, scale);
  }

  public void bounce() {
    if (this.position.x > Window.right) {
      this.position.x = Window.right;
      this.velocity.x *= -1;
    } else if (this.position.x < Window.left) {
      this.position.x = Window.left;
      this.velocity.x *= -1;
    }

    if (this.position.y < Window.bottom) {
      this.position.y = Window.bottom;
      this.velocity.y *= -1;
    }
  }
}
