class Object extends sprite {    
  float spdM = 3;
  int object;
  
  Object(String id, PVector pos, PVector vel, PVector acc) {
     super(id, pos, vel, acc);          //has the constructor of the parent class
     
     this.acc = new PVector(0.0,0.05);        // SET FALLING SPEEED
     this.acc.y = random(0.005,0.05);
     
     // CREATES IMAGES
     this.regA(new animation("apple", "png"));
     this.regA(new animation("apple_1", "png"));
     this.regA(new animation("apple_2", "png"));
     this.regA(new animation("apple_3", "png"));
     this.regA(new animation("apple_4", "png"));
     this.regA(new animation("apple_5", "png"));
     this.regA(new animation("apple_6", "png"));
     this.regA(new animation("apple_7", "png"));
     this.regA(new animation("apple_8", "png"));
     
     // ADDS IMAGES TO THE OBJECT
     this.object = int(random(2));
     this.curA = 0;

     this.pos.x = random(100, width -100);
     this.pos.y = -this.h+random(-720*2 +25,0);        //+# so centered in middle of sprite
     this.rotate = 90.0 + this.pos.x;                  //give a rotation
     
     this.scale = 0.2;
     this.w = 45;                                      //change width of hitbox
     this.h = 45;                                      // change height of hitbox
     
     this.radCW = w/2.0;
     this.radCH = h/2.0;
     
     this.reg.x = this.w/2;                  //offset the animation X around the hitbox
     this.reg.y = this.h/2;             //offset the animation Y around the hitbox
  }
  
  void check(int n) {
    collision c = new collision(this, true);
    int a = c.b2c(100,100,width-200,height-200+this.h,false);     
    if(a == collision.BOTTOM) {
      this.pos.y = -this.h-random(0,200);
      this.pos.x = random(100, width -100);
      this.vel.x = 0;
      this.vel.y = 0;
      this.acc.y = random(0.005,0.05);
      this.rotate = 90.0 + this.pos.x;            //give new rotation 
      this.curA = 0;                              // RESET animation branch  
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
