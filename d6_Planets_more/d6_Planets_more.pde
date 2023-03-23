class planet {
 float speed = 1.0;
 float angle = 0.0;
 float dist = 100.0;
 float size = 10.0;
 color col = color(255,255,255);
 
 void drawPlanet(float angle, float distance, float size, color c)
  {
   pushMatrix();
     rotate(radians(angle));
     translate(0,distance);
     fill(c); 
     circle(0,0,size); 
   popMatrix(); 
  }
 
}

planet first = new planet(); //enable the class

void setup () {
 size(1200,800); 
}

void draw () {
  noStroke(); 
  fill(0,0,0,5); 
  rect(0,0,width,height);
  translate(width/2,height/2);
  
  drawPlanet(first.angle, first.dist, first.size, first.col);
  first.angle += first.speed;
}
