sprite s;

void setup() {
   size(720,720);
   s = new sprite("test", new PVector(width/2,height/2), new PVector(0,0), PVector.random2D());
   s.acc = new PVector(0.01,0);
   s.regA(new animation("ball_test", "svg"));
   s.regA(new animation("r_zombie", "svg"));
   //s.h = 200;
}

void draw () {
  background(255);
  fill(222);
  rect(100,100,width-200,height-200);
  s.update();
  s.show();
  s.check();
}

void mouseClicked() {
  s.acc.x *= -1.0; 
  s.vel.x *= -1.0; 
}
//z.spd = constrain((float)mouseX/width,0.12,0.35);
