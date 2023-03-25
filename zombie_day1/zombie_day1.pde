animation z;

void setup() {
   size(720,720);
   z = new animation("zombie", "svg");
}

void draw () {
  background(255);
  translate(width/2,height/2);
  z.spd = constrain((float)mouseX/width,0.12,0.35);
  println((float)mouseX/width);
  z.display();
}
