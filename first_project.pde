float _cx = 0.0; //circle set x-cord
float _cd = 15;
float _d=40;

void setup() {
  size(800,600);
}

void draw () { 
  noStroke();
  fill(0,0,50,10);
  rect(0,0,width,height);
  fill(255);
  circle(_cx,height/2,_d);
  _cx = _cx + _cd;
        
  if(_cx > width-_d/2 || _cx+_d < 0){
    _cd *= -1;
  }
}

/**
typing multiple
lines
*/
