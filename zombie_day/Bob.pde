class Bob extends sprite {    //extends: so Bob has everything that is in the sprite class
  float spdM = 3;       //set topspeed
  float hits;
     
  Bob(String id, PVector pos, PVector vel, PVector acc) {
     super(id, pos, vel, acc);      //has the constructor of the parent class
     hits = 0;
    
     this.acc = new PVector(0.05,0);                                    //walk speed horizontal ONLY - else could walk out of collion box
     this.regA(new animation("zombie", "svg"));                             //animation 1
     this.regA(new animation("r_zombie", "svg"));                          //animation 0 - reverse
     
     this.scale = 0.7;                                      //scale of object
     this.pos.y = height-this.h-75;
  }
  
  void check(int n) {
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
    
    fill(255,0,0);
    
    for(int i=0; i <n; i++) {
      a = c.c2c(z[i]);                          //when these objects collide with Bob
      if(a == collision.IN) {                     //a: is just a varible for the result
          hits += .2;                          //a bit of a cheat to count the number of hits since "break" isnt quick enough to stop multiple counts of the same object
          text("HIT!  "+ int(hits), width/2, height-6);     //round points to be an intiger
      }
    }
    text("HIT!  "+ int(hits), width/2, height-6);
  }
  
} 
