class sprite {
  PVector pos,vel,acc;
  String id = "";
  
  float w = 100;  //width of collison box
  float h = 100;  //height of collison box
  PVector reg = new PVector(w/2.0, h/2.0);  //set registation point in center of object
  float radC = w/2.0;    //radius of collsion box
  
  int maxA = 10;         //Mamium number of animations
  int curA = 0;           //current animation
  animation[] A = new animation[maxA];
  
  sprite(String id, PVector pos, PVector vel, PVector acc) {
     this.id = id;
     this.pos = pos;
     this.vel = vel;
     this.acc = acc;
  }
  
  void update() {
    this.vel.add(this.acc);
    this.pos.add(this.vel);
  }
  
  void show() {
     pushMatrix();
       translate(this.pos.x*2, this.pos.y*2);
      
       noFill();
       stroke(50);
       rect(-reg.x, -reg.y, this.w, this.h);
       noStroke();
       
       fill(color(0, 255, 10));
       circle(0,0,this.radC*2);
       
       fill(color(255,50,10));
       circle(0,0,10);
     popMatrix();
  }
  
  void check() {
    if(this.pos.x < -200) this.pos.x = width;
    if(this.pos.y < -200) this.pos.y = height;
    if(this.pos.x > width) this.pos.x = -200;
    if(this.pos.y > height) this.pos.y = -200;
    this.vel.limit(10);                                      //set max speed of sprite
    
  }
  
}
