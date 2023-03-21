PVector location = new PVector(100,100);
PVector velocity = new PVector(1,3.3);
PVector acceleration = new PVector(0.1,0.9);
int nBalls = 100;
Mover[] move = new Mover[nBalls];

void setup() {
  //size(1200,800);
  fullScreen();
  background(255);  
  noStroke();
  //move.velocity.x = random(1.0,3.3); // not need since have acceleration
  //move.velocity.y = random(1.0,3.3);
  
  for(int i=0; i < nBalls;i++)
  {
    move[i] = new Mover(i+random(width),height/2); //center on screen
  }
}

void draw()
{
  fill(255,255,255);
  rect(0,0,width,height);
  velocity.add(acceleration);
  location.add(velocity);
    
   for(int i=0; i < nBalls;i++)
   {
     move[i].applyForce(new PVector(0.0,0.1), new PVector(0.01,0.0)); //gravity & wind
     move[i].display();     
     move[i].update();
     move[i].check();
   }
}



/*PVector update(PVector value, PVector inc)
{
 PVector result = value;
 result.x += inc.x        //PVectors need to have both vaules -- this is what the "add" does in the PVector class
 result.y += inc.y
 return(result);
}
*/
