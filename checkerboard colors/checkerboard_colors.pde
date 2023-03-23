int n =100;
float angle = 0;

void setup()
{
  size(800,800);
  noStroke();
  colorMode(HSB,400);
}

void draw()
{  
  float d = width/n;
  for(int y = 0; y < n; y = y + 1)
  {
    for(int x = 0; x < n; x = x + 1)
    {
      //float hue = random(angle, angle);
      float hue = random(mouseX, mouseX+mouseY);
      float satu = random(400,400);
      float value = random(400,400);
      fill(color(hue,satu,value));
      rect(x*d,y*d,d,d);
    }
  }  
  angle +=5;
  if(angle>400) angle=0;
}
