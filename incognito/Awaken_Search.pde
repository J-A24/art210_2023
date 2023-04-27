class Awaken_Search extends sprite{
  float hits, mouse_rad;
  
     
  Awaken_Search(String id, PVector pos, PVector vel, PVector acc, float mouse_rad) {
    super(id, pos, vel, acc);  
    this.mouse_rad = mouse_rad;
    
     this.acc = new PVector(0.0,0.0);                                    //walk speed horizontal ONLY - else could walk out of collion box
     this.regA(new animation("CursorMG", "png"));            //For DEBUG
     
     this.scale = 0.1;
     this.pos.y = mouseY;
     this.pos.x = mouseX;
     this.h = 60;              //change height of hitbox
     this.w = 60;              //change height of hitbox
     
     this.radCW = w/2.0;
     this.radCH = h/2.0;
     
     this.reg.x = this.w/2;                  //offset the animation X around the hitbox
     this.reg.y = this.h/2;             //offset the animation Y around the hitbox
  }
  
  void update() {
    this.pos.y = mouseY;
     this.pos.x = mouseX;
  }
  
  void hit(Object[] z) { 
    //frameRate(10);
    //Awaken_Search.check();
    for(int j = 0 ; j < z.length; j ++) {
      float dist2 = pos.dist(z[j].pos);
      if(int(dist2) < mouse_rad) {
          if(z[j].curA ==0) {               // CANNOT CHANGE COLOR IF NOT BLACK APPLE
          z[j].curA = int(random(1,9));     // WHEN HIT CHANGE COLOR
          z[j].scale = 0.3;
        }
      }
      if(iDEBUG) {
        line(z[j].pos.x,z[j].pos.y, mouseX, mouseY);
     }
    }
    if(iDEBUG) {
        fill(255, 100, 200, 10);
        ellipse(this.pos.x, this.pos.y, mouse_rad, mouse_rad);
    }
  }
}
