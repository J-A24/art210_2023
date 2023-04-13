class audio {
  PApplet app;
  SoundFile hi;
  float soundLevel = 1;
  
  
  audio (PApplet app) {  
    this.app = app;
    this.env = new Env(this.app);
  }
  
  void fadeIn() {
     
  }
  
  void fadeOut() {
     
  }
  
  void show() {
     this.hi.amp(this.soundLevel);
  }
