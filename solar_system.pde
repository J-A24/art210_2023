// using Planetary Fact Sheet - Metric

class planet {
 float speed = 1.0;
 float angle = 0.0;
 float dist = 100.0;
 float size = 50.0;
 color col = color(255,255,255);
 
 planet() //constuctor
 {
  this.speed = random(-5,10); 
  this.dist = random(20,160);
 }
 
 void update ()
 {
  this.angle += this.speed;
 }
 
 void draw ()
  {
   pushMatrix();
     rotate(radians(this.angle)); //"this" - means all the time (an inside var, avoid global var)
     translate(0,this.dist);
     fill(this.col); 
     circle(0,0,this.size); 
   popMatrix(); 
  }
}


planet sun = new planet ();
planet mercury = new planet ();
planet venus = new planet ();
planet earth = new planet ();
planet mars = new planet ();
planet jupiter = new planet ();
planet saturn = new planet ();
planet uranus = new planet ();
planet neptune = new planet ();
planet pluto = new planet ();

void setup () {
 fullScreen();
  sun.dist = 0.0;
  sun.size = 90;
  sun.col = color(255,255,0);
  mercury.dist = 57.9;
  mercury.speed = 4.74;
  mercury.col = color(255,0,0);
  venus.dist = 108.2;
  venus.speed = 3.5;
  venus.col = color(0,255,255);
  earth.dist = 149.6;
  earth.speed = 2.98;
  earth.col = color(0,0,255);
  mars.dist = 228.0;
  mars.speed = 2.4;
  mars.col = color(155,155,0);
  jupiter.dist = 778.5;
  jupiter.speed = 1.31;
  jupiter.col = color(255,155,0);
  saturn.dist = 1432.0;
  saturn.speed = 0.97;
  saturn.col = color(255,155,155);
  mars.dist = 228.0;
  mars.speed = 2.4;
  mars.col = color(155,155,0);
  jupiter.dist = 778.5;
  jupiter.speed = 1.31;
  jupiter.col = color(255,155,0);
  saturn.dist = 1432.0;
  saturn.speed = 0.97;
  saturn.col = color(255,155,155);
  uranus.dist = 2867.0;
  uranus.speed = 0.68;
  uranus.col = color(0,255,155);
  neptune.dist = 4515.0;
  neptune.speed = 0.54;
  neptune.col = color(0,155,255);
  pluto.dist = 5906.4;
  pluto.speed = 0.47;
  pluto.col = color(155,155,155);
}

void draw () {
  noStroke(); 
  fill(0,0,0,35); 
  rect(0,0,width,height);
  translate(width/2,height/2);
  
  scale(.2); //dec by % of size of objects
  
  sun.draw();
  sun.update();
  mercury.draw();
  mercury.update();
  venus.draw();
  venus.update();
  earth.draw();
  earth.update();
  mars.draw();
  mars.update();
  jupiter.draw();
  jupiter.update();
  saturn.draw();
  saturn.update();
  uranus.draw();
  uranus.update();
  neptune.draw();
  neptune.update();
  pluto.draw();
  pluto.update();
}
