class Mover //never use gobal var so class is self sustaining
{
  PVector location = new PVector(0,0);
  PVector velocity = new PVector(0,0);
  PVector acceleration = new PVector(0,0);
  float topspeed;
  float mass =1;
  
  Mover(float _x, float _y) 
  {
    this.location.x = _x;
    this.location.y = _y;
    this.acceleration.x = -0.001;
    this.acceleration.y = 0.01;
    topspeed =10;
  }
  
  void display()
  {
    fill(50,50,200);

   circle(this.location.x,this.location.y,16);
  }
  
  void applyForce(PVector gravity, PVector wind) {
     PVector f = PVector.div(gravity,mass);
     this.acceleration.add(f);
  }
  
  
  void update()
  {
   /*PVector mouse = new PVector(mouseX,mouseY);
   PVector dir1 = PVector.sub(mouse,location);
   dir1.normalize();
   dir1.rotate(radians(50)); //if used ball will avoid you
   
   PVector dir2 = PVector.random2D();
   dir2.normalize(); //so vector length equal to 1
   dir2.mult(3); //more extreme movement in randomness of the vector
   
   //PVector dir = PVector.lerp(dir1,dir2,0.5); //colcuate between 2#s and how often it checks the dist between
   float sliderVaule = PVector.sub(mouse,location).mag()/-400.0; //mag returns the length of vector & divied by # to change dection range
   if (sliderVaule >1.0) sliderVaule =1.0;
   PVector dir = PVector.lerp(dir1,dir2,sliderVaule);
   
   this.acceleration = dir.mult(.5);
    */
    
       
       //have the ball move
   this.velocity.add(this.acceleration);
   this.velocity.limit(topspeed); //"limit" built into procressing doesnot allow to across a given value
   this.location.add(this.velocity); 
  }
  
  void check()
  {
      //bounce off walls of given canvas
  if ((this.location.x > width) || (this.location.x < 0)) this.velocity.x *= -1;
  if ((this.location.y > height) || (this.location.y < 0)) this.velocity.y *= -1;
  
      //warp - no bounce
  //if((this.location.x < 0)) this.location.x = width;
  //if((this.location.x > width)) this.location.x = 0;
  //if((this.location.y < 0)) this.location.y = height;
  //if((this.location.y > height)) this.location.y = 0;
 
  }
}
