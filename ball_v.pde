PVector location = new PVector(100,100);
PVector velocity = new PVector(1,3.3);
PVector acceleration = new PVector(0.1,0.9);
Mover move;

void setup() {
  size(640,360);
  background(255);  
  noStroke();
  //move.velocity.x = random(1.0,3.3); // not need since have acceleration
  //move.velocity.y = random(1.0,3.3);
  
  move = new Mover(width/2,height/2); //center on screen
}

void draw()
{
  fill(255,255,255);
  rect(0,0,width,height);
  velocity.add(acceleration);
  location.add(velocity);
    
   fill(50,50,200);
   move.display();
   move.update();
   move.check();
}



/*PVector update(PVector value, PVector inc)
{
 PVector result = value;
 result.x += inc.x        //PVectors need to have both vaules -- this is what the "add" does in the PVector class
 result.y += inc.y
 return(result);
}
*/
