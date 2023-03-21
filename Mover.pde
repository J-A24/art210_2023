class Mover //never use gobal var so class is self sustaining
{
  PVector location = new PVector(0,0);
  PVector velocity = new PVector(0,0);
  PVector acceleration = new PVector(0,0);
  
  Mover(float _x, float _y) 
  {
    this.location.x = _x;
    this.location.y = _y;
    this.acceleration.x = -0.001;
    this.acceleration.y = 0.01;
  }
  
  void display()
  {
    fill(50,50,200);

   circle(this.location.x,this.location.y,16);
  }
  
  void update()
  {
    this.velocity.add(this.acceleration);
   this.location.add(this.velocity); 
  }
  
  void check()
  {
      //bounce off walls of given canvas
  //if ((this.location.x > width) || (this.location.x < 0)) this.velocity.x *= -1;
  //if ((this.location.y > height) || (this.location.y < 0)) this.velocity.y *= -1;
  
      //warp - no bounce
  if((this.location.x < 0)) this.location.x = width;
  if((this.location.x < width)) this.location.x = 0;
  if((this.location.y < 0)) this.location.y = height;
  if((this.location.y < height)) this.location.y = 0;
  }
}
