public class Walker {
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;
  public float r, g, b, a;
  public float gravitationalConstant = 1;

  public Walker() {}

  public void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); 
  }

  public void update() {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // Clear for next frame
  }

  public void render() {
    fill(r, g, b, a);
    noStroke();
    circle(position.x, position.y, scale);
  }

  public PVector calculateAttraction(Walker other) {
    // 1. Calculate direction vector
    PVector force = PVector.sub(this.position, other.position);
    
    // 2. Calculate distance
    float distance = force.mag();
    
    // 3. Accurately get direction
    force.normalize();
    
    // 4. Constraint (Prevents extreme forces when distance is tiny)
    distance = constrain(distance, 10, 25);
    
    // 5. Newton's Law of Universal Gravitation: F = G * (m1 * m2) / r^2
    float strength = (this.gravitationalConstant * this.mass * other.mass) / (distance * distance);
    
    force.mult(strength);
    return force;
  }
}
