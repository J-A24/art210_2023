float _cx = 0.0; //circle set x-cord
float _cy = 0.0; 
float _cdx = random(10,15); //will be given a random direction (once)
float _cdy = 15;     //circle x-speed & direction

void setup() {
  size(800,600); //screen size
}

void draw () { 
  noStroke();    //no countour line
  fill(255,255,255,60);  //white bg
  rect(0,0,width,height);
  fill(0,0,150);       //new color for circle
  circle(_cx,_cy,40);  //draw new circle
  _cy = update(_cy,_cdy);
  _cx = update(_cx,_cdx);        
  _cdy = check(_cy,_cdy,0,height);
  _cdx = check(_cx,_cdx,0,width);
}

float update(float value, float increment) //create local varables
{
 return(value + increment); 
}

float check(float value, float delta, float lower_limit, float upper_limit)
{
  if(value > upper_limit || value < lower_limit)
  {
    return(delta * (-1)); //switch to opposite direction
  }
  return(delta);
}
