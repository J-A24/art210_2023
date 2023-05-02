class Awaken extends sprite {    //extends: so Bob has everything that is in the sprite class
  float spdM = 3;       //set topspeed

  Awaken(String id, PVector pos, PVector vel, PVector acc) {
     super(id, pos, vel, acc);     
    
     this.acc = new PVector(0.05,0);                                    //walk speed horizontal ONLY - else could walk out of collion box
     this.regA(new animation("awaken", "svg"));
     
     this.scale = 0.45;                                      //scale of object
     this.pos.y = height-this.h-130;
     //this.pos.x = width/2 + 10;
     this.h = this.h/2+60;              //change height of hitbox
     this.w = this.w+20;              //change height of hitbox
     
     this.radCW = w/2.0;
     this.radCH = h/2;
     
     this.reg.x = this.w-60;
  }
  
  void DEBUG() {
     if(iDEBUG) {
       strokeWeight(5);
       line(pos.x,pos.y, mouseX, mouseY);
       strokeWeight(2);
     }
  }
  
  
  void check() {
    collision c = new collision(this, true);
    int a = c.b2c(100,100,width-200,height-200,false);    //fit to box TRUE or FALSE
    if(a == collision.RIGHT || a == collision.LEFT) {     // (to flip direction)
      this.acc.x *= -1.0; 
      this.vel.x *= -1.0; 
    }    
    
    this.vel.limit(this.spdM);                       //set max speed of sprite
  }
} 
