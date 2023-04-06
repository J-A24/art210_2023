/*class Object extends sprite {  
  float spdM = 6;       //set max topspeed
  
  Object(String id, PVector pos, PVector vel, PVector acc) {  
    this.pos = pos;
    this.vel = vel;
    this.acc = acc;
    this.scale = .6;
    this.rotate = 90.0;
  }
  
  void check() {   
   collsion c = new collsion(this,true);
   int a = c.b2c(100,100,width-200,height-200,false);   //check collison with object
   if(a == collison.BOTTOM) {
     this.pos.y = -height-h; 
     this.pos.x = random(w,width-w);
     this.vel.x *= 0.0; 
     this.vel.y *= 0.0; 
     this.acc.y = random(0.01,0.1);
   }
   a = c.c2c(a);                 //check for collison of circle
   if(a == collison.IN);
   
  }
} */
