int nBalls = 1000;
ball[] aBall = new ball[nBalls];

void setup()
{
  //size(800,600);
  fullScreen();
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
    aBall[i].display(nBalls);
    aBall[i].move();
    aBall[i].check(width,height);
  }
} 
