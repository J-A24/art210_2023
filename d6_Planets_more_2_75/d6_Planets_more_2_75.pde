class planet {
 float speed = 1.0;
 float angle = 0.0;
 float dist = 100.0;
 float size = 10.0;
 color col = color(255,255,255);
 int nMoons = 0;
 ArrayList<planet> moons = new ArrayList<planet>();
 
 planet(int moons) //constuctor - need parameter for # of moons
 {
  this.speed = random(-5,10); 
  this.dist = random(20,160);
  this.nMoons = moons; //number of moons
  this.col = color (random(55,255),random(55, 255), random(55,255)); //chooses a color of every object
  for(int i = 0; i < this.nMoons; i++)
   {  
    planet aMoon = new planet(0); //new var
    aMoon.col = this.col;
    this.moons.add(aMoon);
   }
 }
 
 
 void update ()
 {
  this.angle += this.speed;
 }
 
 void draw () //a method
  {
   pushMatrix();
     rotate(radians(this.angle));
     translate(0,this.dist);
     fill(this.col); 
     circle(0,0,this.size); 
     for(int i = 0; i < this.nMoons; i++)
     {
      planet nMoon = this.moons.get(i); //for the current index
      nMoon.draw();
      nMoon.update(); 
    }
    popMatrix();
  }
}

int nPlts = 4;
ArrayList<planet> planets = new ArrayList<planet>();

void setup () {
 colorMode(HSB);
 size(1200,800);
 for(int i = 0; i < nPlts; i++)
 {
   planet aPlanet = new planet(floor(random(4))); //local var
   aPlanet.size = 30;
   planets.add(aPlanet);
 }
}

void draw () {
  noStroke(); 
  fill(0,0,400,5); 
  rect(0,0,width,height);
  translate(width/2,height/2);
  
 for(int i = 0; i < nPlts; i++)
 {
  planet aPlanet = planets.get(i); //local var for the current index
  aPlanet.draw();
  aPlanet.update();
 }
}
