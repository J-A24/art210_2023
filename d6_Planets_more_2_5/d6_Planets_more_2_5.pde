class planet {
 float speed = 1.0;
 float angle = 0.0;
 float dist = 100.0;
 float size = 10.0;
 color col = color(255,255,255);
 
 planet() //constuctor - a special metod -  runs once on creation of object
 {
  this.speed = random(-5,10); 
  this.dist = random(20,160);
  this.col = color (random(0,255),random(0, 255), random(0,255)); //chooses a color of every object - once!
 }
 
 
 void update ()
 {
  this.angle += this.speed;
  //this.col = color (random(0,255),random(0, 255), random(0,255)); //changes color of object on every update
 }
 
 void draw () //a method
  {
   pushMatrix();
     rotate(radians(this.angle)); //"this" - means all the time (an inside var, avoid global var)
     translate(0,this.dist);
     fill(this.col); 
     circle(0,0,this.size); 
   popMatrix(); 
  }
}

int nPlts = 100;
ArrayList<planet> planets = new ArrayList<planet>(); //specific to java

void setup () {
  colorMode(HSB);
 size(1200,800);
 for(int i = 0; i < nPlts; i++)
 {
  planets.add(new planet()); 
 }
}

void draw () {
  noStroke(); 
  fill(0,0,0,5); 
  rect(0,0,width,height);
  translate(width/2,height/2);
  
 for(int i = 0; i < nPlts; i++)
 {
  planet buf = planets.get(i); //create a buffer local var - is tempoary - the current index
  buf.draw();
  buf.update();
 }
}
