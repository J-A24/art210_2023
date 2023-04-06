sprite s;
//Bob s;
//int n = 1;
//Object z = new Object[n];
boolean test = false;

void setup() {
  noStroke();
   size(720,720);
   
   //for(int i=0; i <n, i++) z[i] new Object("object"+i);
   
   s = new sprite("test", new PVector(width/2,height/2), new PVector(0,0), PVector.random2D());
   s.acc = new PVector(0.01,0);
   s.regA(new animation("zombie", "svg"));
   s.regA(new animation("r_zombie", "svg"));
   
   //z = new sprite("test", new PVector(width/2,height/2), new PVector(0,0), PVector.random2D());
   //z.acc = new PVector(0.01,0);
   //z.regA(new animation("z1", "svg"));
   //z.regA(new animation("z2_test", "svg")); 
   
   //s = new Bob("test", new PVector(width/2,height/2), new PVector(0,0), PVector.random2D());
   //s = new Object("snake-",, new PVector(width/2,height/2), new PVector(0,0), PVector.random2D());
   
}

void draw () {
  background(255);
  fill(222);
  rect(100,100,width-200,height-200);
  
  //for(int i=0; i <n, i++) {
    s.update();
    s.show();
    s.check();
    s.test = test;
   //}
}

void mouseClicked() {
  s.acc.x *= -1.0; 
  s.vel.x *= -1.0; 
  if(test != true) {
    test = true; 
  } else {
  test = false;
}
  
  //z.acc.x *= -1.0; 
  //z.vel.x *= -1.0; 
}
