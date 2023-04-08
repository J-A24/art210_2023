import processing.sound.*;

Bob s;
int n = 200;
Object[] z = new Object[n];

boolean test = false;       //to allow when clicking if testing hitboxes display

void setup() {
  noStroke();
   size(720,720);
   textAlign(CENTER);
   textSize(128);
   
   s = new Bob("ANY", new PVector(width/2,height/2), new PVector(0,0), PVector.random2D());
   for(int i=0; i <n; i++) {
      z[i] = new Object("ANYYY"+i, new PVector(width/2,height/2), new PVector(0,0), PVector.random2D());
   }  
}

void draw () {
  background(255);
  fill(222);
  rect(100,100,width-200,height-200);
  
  s.show();
  s.update();
  s.check(n);      //to check collion of the objects
  s.test = test;          
  
  for(int i=0; i <n; i++) {
    z[i].update();
    z[i].show();
    z[i].check();
   } 
}

void mouseClicked() {
  if(test != true) {
    test = true; 
  } else {
  test = false;
  } 
  stop();
}

void keyPressed() {
  s.acc.x *= -1.0; 
  s.vel.x *= -1.0; 
}
