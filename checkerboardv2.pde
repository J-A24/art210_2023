int _nRect = 8;


void setup() {
  size(800,800);
  noStroke();
  colorMode(HSB,400);
}

void draw(){
  float _size =width/_nRect; //determines the num of rects (rows and columns)

  for (int y=0; y<_nRect; y+=1) {
    for (int x=0; x<_nRect; x+=1) {
      if ((x+y) % 2 > 0) {
        fill(random(10,10),random(10,200),random(30,300)); 
      }
      else {
       fill(400);
      }
      drawRect(x,y,_size);
    
    }
  }
}

void drawRect (float x, float y, float size) {
  rect(x*size, y*size, size, size);
  //println("x = "+x+"   y = "+y+ "    x+y= "+(x+y));
}
