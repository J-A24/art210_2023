float _cx = 0.0; //circle set x-cord
float _cy = 0.0; 
float _cdx = random(10,15); //will be given a random direction (once)
float _cdy = 15;     //circle x-speed & direction

void setup() {
  size(800,600); //screen size
}

void draw () { 
  drawCir(_cx, _cy);
  _cx=_cx + _cdx;
  _cy=_cy + _cdy;
  
    if(_cx > width || _cx < 0) // or
  {
    _cdx *= -1; //switch to opposite direction
  }
  
  if(_cy > height || _cy < 0) // or
  {
    _cdy *= -1; //switch to opposite direction
  }
}

void drawCir (float x, float y) {
  noStroke();    //no countour line
  fill(255,255,255,60);  //white bg
  rect(0,0,width,height);
  fill(0,0,150);       //new color for circle
  circle(x,y,20);  //draw new circle
}

//orginal code below - above is more abstract but condensed

/**void check() { 
  _cy = _cy + _cdy;
  _cx = _cx + _cdx;
}

void check() {     //make "tool"
  if(_cx > width || _cx < 0) // or
  {
    _cdx *= -1; //switch to opposite direction
  }
  
  if(_cy > height || _cy < 0) // or
  {
    _cdy *= -1; //switch to opposite direction
  }
}

*/
