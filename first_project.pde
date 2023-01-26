float _cx = -20.0; //circle set x-cord

void setup() {
  size(800,600);
}

void draw () { 
  noStroke();
  fill(0);
  rect(0,0,width,height);
  fill(255);
  circle(_cx,height/2,40);
            
  //if(_cx > width) _cx = 0.0;          
  if(_cx > width+20.0) {
    _cx = -20.0;
  }
  else {
  _cx++;     //or _cx += 1
  }
}

/**
hello
*/
