class ground extends sprite{
  float endDistance = 0;
  int maxGround = 1; 
  
  ground(String id, PVector pos, PVector vel, PVector acc)
  {
    super(id, pos, vel, acc);
    for(int i = 0; i < this.maxGround; i = i + 1) {
      this.pos.x = i *1000;
    }
    this.pos.y = height-300;
    this.endDistance = (this.maxGround-2)*1000;
    
    this.regA(new animation("ground1","png"));
    this.vel.x = -5.0;
    this.radCW = 0;
    this.radCH = 0;
    this.w=1000;
    this.h=300;
    this.reg.x = 0;
    this.reg.y = 0;
    for(int i = 0; i < this.nA; i = i +1)
    {
      this.A[i].aPos = CORNER;
    }
    this.curA = floor(random(0,3));
  }
  
  void check() {
    if(this.pos.x < -this.w) {
      float diff = this.pos.x + this.w;
      this.pos.x = this.endDistance+diff;
      this.curA = floor(random(0,3));
    }  
  }
  
  void update() {
      this.update();
  }
  
    void show() {
      this.show();
  }
  
  //void check2() {
    //this.check();
  //}
}
