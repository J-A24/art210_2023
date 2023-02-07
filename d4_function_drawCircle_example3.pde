int _nPlt = 150;
float[] _speed = new float[_nPlt]; //array - a serise of floats - here is 10 index vaules (0-9)
float[] _angle = new float[_nPlt];
float[] _dist = new float[_nPlt];
float[] _size = new float[_nPlt];
color[] _color = new color[_nPlt];
boolean[] _isMoon = new boolean[_nPlt];

void setup() {
  //size(1000,800);
  fullScreen();
  colorMode(HSB, 200);
  for(int i=0;i<_nPlt;i+=1) {
   _speed[i]=random(0,10);
  _angle[i]=0.0;
  _dist[i]=random(50,250);
  _size[i]=random(10,60);
  _color[i]=color(random(200),random(200),random(255));
  _isMoon[i]=random(-1,1) > 0;
  }
}

void draw () { 
  noStroke(); 
  rect(0,0,width,height);
  translate(width/2,height/2); //displace - moves cir to center of screen
  
  for(int i  = 0; i < _nPlt;i += 1) {
    drawPlanets(_angle[i],_dist[i],_size[i],_color[i],_isMoon[i]);
    _angle[i] += _speed[i];
  }
}

void drawPlanets (float angle, float distance, float size, color c, boolean moon) {
  if(moon){
    pushMatrix(); //transformations are seperate here
      rotate(radians(angle));
      translate(0,distance); //displace object
      fill(c);  //new color for circle
      circle(mouseX/2,mouseY/2,size);  //movej from 0,0 to expand or shrink dist
    popMatrix(); //restores
  pushMatrix(); //transformations are seperate here
    rotate(radians(angle));
    translate(0,distance); //displace object
    fill(c);  //new color for circle
    circle(0,0,size);  //movej from 0,0 to expand or shrink dist
  popMatrix(); //restores
  }
}
