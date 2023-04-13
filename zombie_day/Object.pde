class Object extends sprite {    
  float spdM = 3;
  
  Object(String id, PVector pos, PVector vel, PVector acc) {
     super(id, pos, vel, acc);          //has the constructor of the parent class
     
     this.acc = new PVector(0.00,0.03);
     this.regA(new animation("ball_test", "svg"));
     this.pos.x = random(100, width -100);
     this.pos.y = -this.h+random(-720*2,0);
     
     this.scale = 0.45;
     this.rotate = 90.0;                            //initialize the roatation of the object (I didnt need this but good to know if make use of later)
     this.w = 45;                                      //change width of hitbox
     this.h = 45;                                      // change height of hitbox
     this.reg.x = this.w/2;                  //offset the animation X around the hitbox
     this.reg.y = this.h /2;             //offset the animation Y around the hitbox
     
     this.radC = w/2.15;
  }
  
  void check() {
    collision c = new collision(this, true);
    int a = c.b2c(100,100,width-200,height-200+this.h,false);     
    if(a == collision.BOTTOM) {
      this.pos.y = -this.h-random(0,200);
      this.pos.x = random(100, width -100);
      this.vel.x = 0;
      this.vel.y = 0;
      this.acc.y = random(0.00, 0.6);
    }   
    
    //a = c.c2c(s);                          //when these objects collide with Bob
    //if(a == collision.IN) {                     //a: is just a varible for the result
    //}
  }
  
} 
