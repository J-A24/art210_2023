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
 
 void display()
 {
  
   fill(color(20*id,0,100));
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
   if(xCor >maxX || xCor<0) 
   {
     xSp *=-1;
     xSp = Xacceration(int(random(1,3)));
   }
   if(yCor >maxY || yCor<0) 
   {
     ySp *=-1;
     ySp = Yacceration(int(random(1,3)));
   }
  }

  float Xacceration(int rand)
  {
    //if(rand ==1) return xSp+random(0.0,0.2);
    //if(rand ==2) return xSp*.2;
    return xSp;
  }
  float Yacceration(int rand)
  {
    //if(rand ==1) return ySp+random(0.0,0.2);
    //if(rand ==2) return ySp+random(1.0,4.0);
    return ySp;
  }

}
