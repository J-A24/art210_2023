class scene extends sprite{
  int maxGround = ceil(width/126.0);
  
  scene(String id, PVector pos, PVector vel, PVector acc)
  {
    super(id, pos, vel, acc);
    this.regA(new animation("ground1","png"));
    for(int i = 0; i < this.nA; i++) {
      this.A[i].aPos = CORNER;
    }
    
    this.radCW = 0;
    this.radCH = 0;
    this.w=1001;
    this.h=233;
    this.reg.x = 0;
    this.reg.y = 0;
  }
}
