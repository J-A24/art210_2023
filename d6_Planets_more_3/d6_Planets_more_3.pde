class planet {
 float speed = 1.0;
 float angle = 0.0;
 float dist = 100.0;
 float size = 10.0;
 color col = color(255,255,255);
 planet moon;
 boolean hasMoon = false;
 
 planet(boolean createMoon) //constuctor - runs once on creation of object
 {
  this.speed = random(-2,3); 
  this.dist = random(20,80);
  if (createMoon) {
    this.moon = new planet(false);
    this.hasMoon = true;
  }
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
     if(this.hasMoon) this.moon.draw();
   popMatrix(); 
   if(this.hasMoon) this.moon.update();
  }
}


planet first = new planet(); //enable the class
planet second = new planet();

void setup () {
 size(1200,800); 
}

void draw () {
  noStroke(); 
  fill(0,0,0,5); 
  rect(0,0,width,height);
  translate(width/2,height/2);
  
  first.draw();
  first.update();
  
  second.draw();
  second.update();
}
