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
     
     this.radCW = w/2.0;
     this.radCH = h/2.0;
     
     this.reg.x = this.w/2;                  //offset the animation X around the hitbox
     this.reg.y = this.h /2;             //offset the animation Y around the hitbox
  }
  
  void check(int n) {
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
    
  for(int i=0; i <n; i++) {
      a = c.c2c(z[i]);                         
      if(a == collision.IN) {                    
        //this.pos.x = random(100, width -100);       //give new x
        //this.pos.y = -this.h+random(-720*2,0);      // give new y
        //s.acc.x *= constrain(random(-3,2 ), -10,10); 
        //s.vel.x *= -1.0; 
      }
    }
  }
} 
