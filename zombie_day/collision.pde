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
  
  int bCheck(float x, float y, float w, float h) {         //check box for ground
    int a=0;
    if(this.s.pos.x < x) a += LEFT;
    if(this.s.pos.y < y) a += TOP;
    if(this.s.pos.x  > x+w) a += RIGHT;
    if(this.s.pos.y > y+h) a += BOTTOM; 
    return(a);
  }
  
  int bCirc(float x, float y, float w, float h) {         
    int b=0;
    if(this.s.pos.x + this.s.radC < x) b += LEFT;
    if(this.s.pos.y + this.s.radC < y) b += TOP;
    if(this.s.pos.x - this.s.radC > x+w) b += RIGHT;
    if(this.s.pos.y - this.s.radC > y+h) b += BOTTOM; 
    return(b);
  }
  
  int c2c(sprite s) {
    if(this.s.id != s.id) {
      PVector dist = PVector.sub(this.s.pos, s.pos);
      float d = dist.mag();
      float md = (this.s.radC + s.radC)/2;   //divide by 2 since it looking at diameter but want radius
      if(d < md) return(IN);
    }
    return(OUT);
  }
  
}
