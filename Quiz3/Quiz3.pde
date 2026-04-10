void setup() // the function that gets called at the very first frame
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255); 
}

void draw() 
{
 
  float gaussianX = randomGaussian();
  float standardDeviationX = 150; 
  float meanX = 0; 
  float x = standardDeviationX * gaussianX + meanX;

  
  float y = random(-height/2, height/2); 

  float gaussianSize = randomGaussian();
  float standardDeviationSize = 10; 
  float meanSize = 20; 
  float thickness = standardDeviationSize * gaussianSize + meanSize;


  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(10, 100); 

  // 5. RENDER
  noStroke();
  fill(r, g, b, a);
  circle(x, y, thickness);
}
