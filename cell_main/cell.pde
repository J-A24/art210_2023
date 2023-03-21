class Cell
{
 float d = 10.0; //width and hight
 int px = 0; //position x - must at interget
 int py = 0; 
 boolean isLive =false;
 
 Cell(int _px, int _py, float _d) // constuctor & new temp permeters
 {
   this.px= _px;
   this.py= _py;
   this.d= _d;
 }
 
 void display()
 {
  if(isLive)
  {
   fill(255); 
  }
  else
  {
   fill(100); 
  }
  rect(this.px*this.d,this.py*this.d,this.d,this.d); 
 }
 
 void click(int mx, int my)
 {
   if(this.px*this.d < mx && (this.px*this.d)*this.d <mx && (this.py*this.d)*this.d >my)
   {
     this.isLive = this.isLive;
   }
   //this.isLive = this.isLive; //if was true then false -or vise versa.
 }
}
