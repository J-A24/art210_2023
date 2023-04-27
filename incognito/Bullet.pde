class Bullet extends sprite {    //extends: so Bob has everything that is in the sprite class
  float spdM = 3;       //set topspeed
  float hits;
     
  Bullet(String id, PVector pos, PVector vel, PVector acc) {
     super(id, pos, vel, acc);     
    
     this.acc = new PVector(0.05,0);                                    //walk speed horizontal ONLY - else could walk out of collion box
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
    if(a == collision.RIGHT || a == collision.LEFT) {     // (to flip direction)
      this.acc.x *= -1.0; 
      this.vel.x *= -1.0; 
    }    
    
    this.vel.limit(this.spdM);                       //set max speed of sprite
  }
  
  
  void hitCount(int n) {
    //collision c = new collision(this, true);
    //int a = c.b2c(100,100,width-200,height-200,false);
    /*fill(255,0,0);
    
    for(int i=0; i <n; i++) {
      a = c.c2c(z[i]);                          //when these objects collide with Bob
      if(a == collision.IN) {                     //a: is just a varible for the result
          hits += 0.3000;                          //a bit of a cheat to count the number of hits since "break" isnt quick enough to stop multiple counts of the same object
      }
    }
    textSize(128);
    text("HIT!  "+ int(hits), width/2, height-6);
    
    if(int(hits) ==200) {                                // SET number of hits to end game
      gState = state.get("end");
    }*/
  }
} 
