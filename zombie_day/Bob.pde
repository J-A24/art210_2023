/*class bob extends sprite {    //extends: so Bob has everything that is in the sprite class
  float spdM = 3;       //set maxium topspeed
  
  bob(String id, PVector pos, PVector vel, PVector acc) {
     //super(id);           //has the constructor of the parent class
     
     this.pos = pos;
     this.vel = vel;
     this.acc = acc;
     this.scale = 1.0;
     this.pos.y = height-this.h;
  }
  
  void check() {
    super.check();   //uses check from the sprite class 
    int a = c.b2c(100,100,width-200,height-200,true);
    if(a == collision.RIGHT || a == collision.LEFT) {
      this.acc.x *= -1.0; 
      this.vel.x *= -1.0; 
    }    
    this.vel.limit(this.spdM);                       //set max speed of sprite
    if(this.vel.x < 0) {           //which animations to use?
      this.curA = 1;             
    } else {
      this.curA = 0;
    }
  }
  
} */
