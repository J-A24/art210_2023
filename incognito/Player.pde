class Player extends sprite {    //extends: so Bob has everything that is in the sprite class
  float spdM = 3;       //set topspeed
  float hits;
     
  Player(String id, PVector pos, PVector vel, PVector acc) {
     super(id, pos, vel, acc);      //has the constructor of the parent class
     hits = 0;
    
     this.acc = new PVector(0.05,0);                                    //walk speed horizontal ONLY - else could walk out of collion box
     this.regA(new animation("player", "svg"));                             //animation 1
     this.regA(new animation("r_player", "svg"));                          //animation 0 - reverse
     
     this.scale = 0.7;                                      //scale of object
     this.pos.y = height-this.h-75;
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
    
    if(this.vel.x < 0) {                            //which animations to use
      this.curA = 1;             
    } else {
      this.curA = 0;
    }
  }
  
  
  void hitCount(int n, int nn) {
    collision c = new collision(this, true);
    int a = c.b2c(100,100,width-200,height-200,false);
    fill(255,0,0);
    
    for(int i=0; i <n; i++) {
      a = c.c2c(z[i]);                              //when these objects collide with Bob
      if(z[i].curA ==0) {         //HIT BY BLACK APPLE
        if(a == collision.IN) {                     //a: is just a varible for the result
          hits += 1.0;                              //a bit of a cheat to count the number of hits since "break" isnt quick enough to stop multiple counts of the same object
          z[i].curA = 11;  
          z[i].scale = 0.3;
          z[i].acc.y = 1.5;
        }
      }
      if(z[i].curA ==1) {          //HIT BY DUCK
        if(a == collision.IN) {                     //a: is just a varible for the result
          z[i].curA = 10;  
          z[i].scale = 0.3;
          z[i].acc.y = 0.5;
          tPoint *= -2;
        }
      }
    }
    for(int j=0; j < nn; j++) {
       float dist1 = pos.dist(b[j].pos);
       if(dist1 < 45) {      // < # for distance from bullet to player
         println("hi");
          gState = state.get("end");
       }
    }
    textSize(92);
    fill(216, 22, 142);
    text("HIT!  "+ int(hits), width/2, height-24);
    
    if(int(hits) >=6) {                                // SET number of hits to end game
      gState = state.get("end");
    }
  }
} 
