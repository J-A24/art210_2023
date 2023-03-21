class ball
{
  float xCor;
  float yCor;
  float xSp;
  float ySp;
  float bSize;
  int id=0;

  
  ball(int _id) //constructor
  {
  this.xCor =10*_id;
  this.yCor =10;
  this.xSp = random(1.0,3.3);
  this.ySp = random(1.0,3.3);
  this.bSize = random(16,36);
  this.id = _id;
  //println(_id);
  }
 
 void display(int colorScale)
 {
  
   fill(color(2.5*id,0,100));
   circle(xCor,yCor,bSize);
   //print(i);
 }
 
 void move()
 {
   xCor += xSp;
   yCor += ySp;
 }
 
  void check(float maxX, float maxY)
 {
   if(xCor >maxX) 
   {
     xSp *=-1;
     xSp -=random(2.0,3.3);
   }
   if(xCor<0) 
   {
     xSp *=-1;
     xSp +=random(1.0,3.3);
   }
   if(yCor >maxY) 
   {
     ySp *=-1;
     ySp -=random(2.0,3.3);
   }
   if(yCor<0) 
   {
     ySp *=-1;
     ySp +=random(1.0,3.3);
   }
  }

}
