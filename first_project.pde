float _cx = 0.01; //circle set x-cord
float _cd = 5; 

void setup() {
  size(800,600);
}

void draw () { 
  noStroke();
  fill(50,50,200,10);
  rect(0,0,width,height);
  fill(255);
  circle(_cx,height/2,40);
  _cx = _cx + _cd;

  if(_cx > width || _cx < 0) // or
  {
    _cd = _cd * (-1);
  }
}

/**
typing multiple lines
like this
*/
