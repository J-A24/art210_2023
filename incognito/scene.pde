class scene {
  int nGround = 0;
  int maxGround = 1;
  ground[] ground = new ground[10];
  animation[] groundA = new animation[3]; //max #(3) of backgrounds
  
  scene() {
   this.maxGround = ceil(width/1000.0)+2;
   for(int i = 0; i < this.maxGround; i = i + 1) {
      this.ground[i]= new ground("ground"+i, new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
      this.ground[i].pos.x = i *1000;
      this.ground[i].pos.y = height-300;
      this.ground[i].endDistance = (this.maxGround-2)*1000;
      this.nGround = i;
    } 
  }
  
  void show() {
    //background(255);
    for(int i = 0; i < this.nGround; i++) {
      ground[i].show();
    }
  }
  
  void update() {
    for(int i = 0; i < this.nGround; i++) {
      ground[i].update();
    }
  }
  
  void check() {
    for(int i = 0; i < nGround; i++) {
      ground[i].check();
    }
  }
}
