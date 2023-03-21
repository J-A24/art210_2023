int nBalls = 10;
ball[] aBall = new ball[nBalls];

void setup()
{
  size(800,600);
  noStroke();
    for(int i=0; i < nBalls;i++)   //i = whatBall
  {
    aBall[i] = new ball(i);
  }
}
  
void draw()
{
  fill(color(0,0,0,93));
  rect(0,0,width,height);
  
    for(int i=0; i < nBalls;i++)
  {
    aBall[i].display();
    aBall[i].move();
    aBall[i].check(width,height);
  }
} 
