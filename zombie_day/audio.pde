/*class audio {
  PApplet app;                         //is an applet
  
  SoundFile[] amb = new SoundFile[5];  //ambient sound         //SF is a medthod from the imported sound
  int nA = 0;                          //the current file
  SoundFile[] mus = new SoundFile[5];    //music                 // max # of files is 5
  int nM = 0;

  TriOsc osc;                          //oscillating
  Env env;                             //envelope
  
  
  audio (PApplet app) {  
    this.app = app;
    this.env = new Env(this.app);
  }
  
  
  void AddAmbient(String filename) {
    if(nA <5) {
      this.amb[this.nA] = new SoundFile(this.app, filename);
      this.nA ++;  
    } else {
      println("No more space for abient music in track"); 
    }
  }
  
    void AddMusic(String filename) {
    if(nM <5) {
      this.mus[this.nM] = new SoundFile(this.app, filename);
      this.nA ++;  
    } else {
      println("No more space for abient music in track"); 
    }
  }
  
  void show() {
    
  }
  
  void update() {
    
  }
  
  void check() {
    
  }
  
} */
