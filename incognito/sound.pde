class sound {
  PApplet app;
  SoundFile me;
  float soundLevel = 0;
  // UNFINISHED //
  
  sound (PApplet app , String filename) {  
    this.app = app;
    this.me = new SoundFile(this.app,filename);
    this.me.loop();
    this.me.stop();   //sound off
  }
  
  void play() {
     
  }
  
   void fadeIn()
   {
     //Ani.to(this, 5, "soundLevel", 1);
   }
   
   void fadeOut()
   {
     //Ani.to(this, 5, "soundLevel", 0);
   }
   
   void update()
   {
     //this.soundLevel = mouseX/(float)width;
   }
   
   void show()
   {
     //this.me.amp(this.soundLevel);
   }
}
