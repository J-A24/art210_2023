animation z;
sprite s;

void setup() {
   size(720,720);
   z = new animation("zombie", "svg");
   s = new sprite("test", new PVector(width/2,height/2), new PVector(0,0), PVector.random2D());
}

void draw () {
  background(255);
  translate(width/2,height/2);
  z.spd = constrain((float)mouseX/width,0.12,0.35);
  z.show();
  s.update();
  s.show();
  s.check();
}
