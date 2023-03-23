class planet {
 float speed = 1.0;
 float angle = 0.0;
 float dist = 100.0;
 float size = 10.0;
 color col = color(255,255,255);
 int nMoons = 0;
 int gen = 2;
 ArrayList<planet> moons = new ArrayList<planet>();
 
 planet(int _gen) //constuctor - need parameter for # of moons
 {
  this.gen = _gen;
  this.speed = random(-2,3); 
  this.dist = random(90,160);
  this.col = color (random(55,255),random(55, 255), random(55,255)); //chooses a color of every object
  if(this.gen>0)
  {
    //this.nMoons = floor(random(15));
    this.nMoons = 4;
    for(int i = 0; i < this.nMoons; i++)
     {  
      planet aMoon = new planet(_gen -1);
      aMoon.col = this.col;
      aMoon.size = (aMoon.gen+1)*10;
      this.moons.add(aMoon);
     }
   }
   else
   {
    this.nMoons =0; 
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
      planet aMoon = this.moons.get(i); //for the current index
      aMoon.update();
      aMoon.draw(); 
    }
   popMatrix();
  }
}

planet sun;

void setup () {
 colorMode(HSB);
 size(1200,800);
 sun = new planet(9); // # of planets
 sun.size =80;
 sun.speed=0;
 sun.col = color(255,180,90);
}

void draw () {
  noStroke(); 
  fill(0,0,0,5); 
  rect(0,0,width,height);
  translate(width/2,height/2);
  scale(1);

  sun.draw();
  sun.update();
}
