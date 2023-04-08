class Bob extends sprite {    //extends: so Bob has everything that is in the sprite class
  float spdM = 3;       //set topspeed
  
  Bob(String id, PVector pos, PVector vel, PVector acc) {
     super(id, pos, vel, acc);      //has the constructor of the parent class
    
     this.acc = new PVector(0.05,0);                                    //walk speed horizontal ONLY - else could walk out of collion box
     this.regA(new animation("zombie", "svg"));                             //animation 1
     this.regA(new animation("r_zombie", "svg"));                          //animation 0 - reverse
     
     this.scale = 0.7;                                      //scale of object
     this.pos.y = height-this.h-75;
  }
  
  void check() {
    collision c = new collision(this, true);
    int a = c.b2c(100,100,width-200,height-200,true);
    if(a == collision.RIGHT || a == collision.LEFT) {            //flip direction
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
  
} 
