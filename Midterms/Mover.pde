public class Mover
{
   public PVector position;
   public float scale = 50;
   public float r = 255, g = 255, b = 255, a = 255;
   
   Mover()
   {
      position = new PVector(); 
   }
   
   Mover(float x, float y)
   {
      position = new PVector(x, y);
   }
   
   Mover(float x, float y, float scale)
   {
      position = new PVector(x, y);
      this.scale = scale;
   }
   
   Mover(PVector position, float scale)
   {
      this.position = position; 
      this.scale = scale;
   }
   
   public void render()
   {
      fill(r,g,b,a);
      noStroke();
      circle(position.x, position.y, scale); 
   }
   
   public void setColor(float r, float g, float b, float a)
   {
      this.r = r;
      this.g = g;
      this.b = b;
      this.a = a;
   }
}
