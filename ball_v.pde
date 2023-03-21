PVector location = new PVector(100,100);
PVector velocity = new PVector(1,3.3);
PVector acceleration = new PVector(0.1,0.9)

void setup() {
  size(640,360);
  background(255);
}

void draw()
{
  background(255);
  velocity.add(acceleration);
  location.add(velocity);
  
  //check for bounce
  if ((location.x > width) || (location.x < 0)) 
  {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 0)) 
  {
    velocity.y = velocity.y * -1;
  }
    
   stroke(0);
   fill(150);
   //ball location update
   ellipse(location.x,location.y,16,16);
 
}
