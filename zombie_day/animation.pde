class animation{
  PShape[] frameS; 
  PImage[] frameI;
  int nFrames;      //have to store to know what to show
  int frame;     // the current frame
  float spd, counter;
  boolean isSvg;
  
  animation(String foldername, String ext) {       //ext is extension(file) type
     nFrames = 0;
     frame = 0;
     spd = 0.1;
     counter = 0;
          
     File dir = new File(dataPath(foldername));
     File[] files = dir.listFiles();
     if(ext == "svg") {
        this.isSvg = true;                                    //now know know if looking at an svg
        this.frameS = new PShape[files.length];
     } else {                                       //if not svg use jpg/gif/png (bc they accpable as PImage)
        this.isSvg = false;                                       //else if not sbg than check if other suppored image type (defined in Processing Dcouments)
        this.frameI = new PImage[files.length];
     }
     int count = 0;
     for (int i=0; i <= files.length - 1; i++) {
       String path = files[i].getAbsolutePath();
       if(path.toLowerCase().endsWith(".svg")) {
         this.frameS[count] = loadShape(path);
         count ++;
       }
       if(path.toLowerCase().endsWith(".jpg") || path.toLowerCase().endsWith(".png")) {
         this.frameI[i] = loadImage(path);
       }
     }
     nFrames = count;
  }
  
  void show() {
    if(isSvg) {
      shapeMode(CENTER);
      shape(this.frameS[this.frame],0,0); 
    } else {
      imageMode(CENTER);
      image(this.frameI[this.frame],0,0); 
    }
    this.counter += this.spd;
    this.frame = floor(this.counter);      //floor: will drop all the numbers after a decimal
    if(this.frame >  nFrames-1) {
      this.counter =0;
      this.frame=0;
    }
  }
  
}
