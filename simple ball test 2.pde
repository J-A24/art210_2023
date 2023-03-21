float _cx = 0.0; 
float _cdx = 1;
float _angle1 = 0.0;
float _speed1 = 10;

float _angle2 = 0.0;
float _speed2 = -10;

void setup() {
  size(800,600); 
}

void draw () { 
  noStroke(); 
  fill(255,255,255,60);  //white bg
  rect(0,0,width,height);
  
  translate(width/2,height/2); //displace - moves cir to center of screen
  
  pushMatrix(); //transformations are seperate here
    rotate(radians(_angle1));
    translate(0,100); //displace object
    drawCir(0,0);
  popMatrix(); //restores
  
  rotate(radians(_angle2));
  translate(0,100); //displace object
  drawCir(0,0);
  
  /*    pretty cool but does tranformation twitce
  rotate(radians(_angle2));
  translate(0,100); //displace object
  drawCir(0,0);
  */
  
  _angle1 += _speed1;
  _angle2 += _speed2;

}

void drawCir (float x, float y) {
  fill(0,0,150);  //new color for circle
  circle(x,y,40);  //draw new circle
}
