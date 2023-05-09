class sprite {
  PVector pos,vel,acc;
  String id = "";
  
  float w = 100;  //width of collison box
  float h = 100;  //height of collison box
  PVector reg = new PVector(w/2.0, h/2.0);  //set registation point in center of object
  float radCW = w/2.0;    //radius of collsion box (width)
  float radCH = h/2.0;    //radius of collsion box (height)
  boolean iDEBUG = false;
  
  int maxA = 24;         //Mamium number of animations
  int curA = 0;           //current animation
  int nA = 0;         //how many animation it has
  animation[] A = new animation[maxA];
  float scale = .6;
  float rotate = 0.0;         //rotation of the object
  PVector translation = new PVector(0,0);
  
  PVector boxC = new PVector(w,h);   //for box coll
  
  sprite(String id, PVector pos, PVector vel, PVector acc) {
     this.id = id;
     this.pos = pos;
     this.vel = vel;
     this.acc = acc;
  }
  
  void regA(animation _A) {      //register animation to the object
     if(this.nA < this.maxA) {
     this.A[this.nA] = _A;
     this.nA ++;
     } else {
       println("ERROR: animation number overflow"); 
     }
  }
  
  
  
  void update() {
    this.vel.add(this.acc);
    this.pos.add(this.vel);
  }
  
  void show() {
      pushMatrix();
       translate(this.pos.x, this.pos.y);      //need to center on canvas
       pushMatrix();
         scale(this.scale);
         translate(this.translation.x, this.translation.y);
         rotate(radians(this.rotate));
         this.A[this.curA].show();
       popMatrix();
       test_show();           //for testing if needed later on
      popMatrix();
  }
  
  void test_show() {             //shows hitboxes
    if(iDEBUG) {              //test: is created in setup (zombie day)
       pushMatrix();
         noFill();
         stroke(75,0,0);
         rect(-reg.x, -reg.y, this.w, this.h);
         noStroke();
         
         fill(color(0, 255, 10,60));
         ellipse(0,0,this.radCW*2, this.radCH*2);
         
         fill(color(255,50,10));
         ellipse(0,0,10,10);
       popMatrix();
    }
  }
  
  void check() {
    /*collision c = new collision(this, true);
    int a = c.b2c(100,100,width-200,height-200,true);               //true=normall || false=adjusted
    //if(a == collision.RIGHT) this.pos.x = 0;
    if(a == collision.RIGHT || a == collision.LEFT) {
      this.acc.x *= -1.0; 
      this.vel.x *= -1.0; 
    }
    
    if(c.c2c(s) == collision.IN) {         //circle to circle detection
      println("Caught!");
    } else {
      println("NOT caught");
    }
    
    if(this.vel.x < 0) {
      this.curA = 1; 
    } else {
       this.curA = 0;
    }
    this.vel.limit(5);                       //set max speed of sprite
        */                                  
  }
  
}
