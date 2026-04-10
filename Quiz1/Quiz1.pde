float amplitude = 40;
float frequency = 0.08;
float timeSpeed = 0.5;


void setup() {
  size(960,540, P3D);
    camera (0,0,-(height/2.0) / tan(PI*30.0 /180.0),0,0,0,0, -1,0);
}

void drawCartesianPlane()
{
  strokeWeight(1); // thick 
    color white = color (255,255,255); // what do you think dumbass
    fill(white); // color of the inside
    stroke(white); // color of stroke 
    
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2); 
    line(-2, i, 2, i);
  }
}



void drawLinearFunctions()
{
 color white = color(200,0,255);
 fill(white);
 noStroke();
 
 for (int x = -200; x <= 200; x++)
 {
   circle(x, (x * -5) + 30, 5); 
 } 
}


void drawQuadraticFunctions(){
  
  color white = color(255,255,0);
 fill(white);
 stroke(white);
 
 for (float x = -300; x <= 300; x+=0.1f)
 {
   circle(x, ((x * x) - (x * 15) - 3), 5);
 }  
}

void drawCircle(){
  color white = color(255,255,255);
 fill(white);
 stroke(white);
 float radius = 50;
 
 for (int x = 0; x <= 360; x++)
 {
   circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  
}
}

void drawSineWave()
{ 
  color white = color(123, 234, 222);
  fill(white);
  stroke(white);
  
  
  for (float x = -250; x <= 250; x++)
  { 
      circle(x, sin(x * frequency + frameCount * timeSpeed) * amplitude, 5);
  }
}


void draw(){ 
  background (155,100,100);
  

  
  drawCartesianPlane();

 
 drawLinearFunctions();
  drawQuadraticFunctions();
 // drawCircle();
 drawSineWave();


 


 
 


}
