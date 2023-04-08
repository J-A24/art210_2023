class collision {
  sprite s;
  boolean isCir = true;    //check for is object colliding with the box
  
  static final int IN = 0;
  static final int OUT = -1;
  static final int TOP = 1;
  static final int BOTTOM = 2;
  static final int LEFT = 3;
  static final int RIGHT = 4; 
  static final int TOP_LEFT = 10;
  static final int TOP_RIGHT = 20;
  static final int BOTTOM_LEFT = 30;
  static final int BOTTOM_RIGHT = 40; 
  
  collision(sprite s, boolean isCir) {
   this.s = s;
   this.isCir = isCir;
  }
  
  int b2p(float x, float y, float w, float h) {                    //box to point: using the true (as programmed) size of canvas without offset from sprites center
  int a=0;
     if(this.s.pos.x  < x) a += LEFT;
     if(this.s.pos.y  < y) a += TOP;
     if(this.s.pos.x > x+w) a += RIGHT;
     if(this.s.pos.y > y+h) a += BOTTOM; 
     return(a);
  }
  
  
  int b2c(float x, float y, float w, float h, boolean IN) {         //check box to the circle
    int a=0;
    if(IN) {                                                     //use within the canvas
      if(this.s.pos.x - this.s.radC < x) a += LEFT;
      if(this.s.pos.y - this.s.radC < y) a += TOP;
      if(this.s.pos.x + this.s.radC> x+w) a += RIGHT;
      if(this.s.pos.y + this.s.radC> y+h) a += BOTTOM; 
      
    } else {                                                       //use out of canvas
      
      if(this.s.pos.x + this.s.radC < x) a += LEFT;
      if(this.s.pos.y + this.s.radC < y) a += TOP;
      if(this.s.pos.x - this.s.radC > x+w) a += RIGHT;
      if(this.s.pos.y - this.s.radC > y+h) a += BOTTOM; 
    }
    return(a);
  }
  
  int c2c(sprite s) {                                                     //cirle to circle
    if(this.s.id != s.id) {                                     //check if current id (in dist around main sprite) is not equal to the main sprite 
      PVector dist = PVector.sub(this.s.pos, s.pos);
      float d = dist.mag();
      float md = (this.s.radC + s.radC)/2.0;   //md is the miniimum distance || also, divide by 2 since it looking at diameter but want radius
      if(d < md) return(IN);
    }
    return(OUT);
  }
  
  int b2b(float x, float y, float w, float h) {
    
    return(0);
  }
  
}
