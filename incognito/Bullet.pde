class Bullet extends sprite {    //extends: so Bob has everything that is in the sprite class
  float spdM = 3;       //set topspeed
  float hits;
     
  Bullet(String id, PVector pos, PVector vel, PVector acc) {
     super(id, pos, vel, acc);     
    
     this.acc = new PVector(0.0,0.5);                                    //walk speed horizontal ONLY - else could walk out of collion box
     this.regA(new animation("ball_test", "svg"));                      
     
     this.scale = 0.6;                                      //scale of object
     this.pos.y = height-this.h-125;
     this.h = this.h/2+40;              //change height of hitbox
     this.w = this.w+20;              //change height of hitbox
     
     this.radCW = w/2.0;
     this.radCH = h/2.0+5;
     
     this.reg.x = this.w-60;
  }
  
  void check() {
    collision c = new collision(this, true);
    int a = c.b2c(100,100,width-200,height-200,false);    //fit to box TRUE or FALSE
    if(a == collision.TOP || a == collision.BOTTOM) {     // (to flip direction)
      this.acc.y *= -1.0; 
      this.vel.y *= -1.0; 
    }    
    
    this.vel.limit(this.spdM);                       //set max speed of sprite
  }
  
  
  void hitPlayer() {
    collision c = new collision(this, true);
    int a = c.b2c(100,100,width-200,height-200,false);    
    //gState = state.get("end");
  }
} 
