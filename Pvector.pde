// this class not nessary sine part of proccessing

class PVector 
{ 
  float x;
  float y;
 
  PVector(float x_, float y_) 
  {
    this.x = x_;
    this.y = y_;
  }
  void add(PVector v) //v - is another vector
  {
    y = y + v.y;
    x = x + v.x;
  }
     
}
