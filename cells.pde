class Cell
{
  float d = 10.0; //sides of a cube
  int px = 0;
  int py = 0;
  int pz = 0;
  boolean isLive = false;
  boolean nextLive = false;
  int id =0; //for the picker
  
  Cell(int _px, int _py, int _pz, float _d, int _id)
  {
    this.px = _px;
    this.py = _py;
    this.pz = _pz;
    this.d = _d;
    this.id = _id;
  }
  
  void display()
  {
    if(isLive) //alternative mode
    {
      fill(255,255,255);
     pushMatrix();
      translate(-this.d*(maxX/2),-this.d*(maxY/2),-this.d*(maxZ/2)); //in minus direction to stya in center
      translate(this.px*this.d,this.py*this.d,this.pz*this.d);
      box(this.d*0.9);
    popMatrix();
    }
    
    /*if(gameState ==0)
    {
      if(this.isLive)
    {
      fill(255);
    }
    else
    {
      fill(100);
    }
    pushMatrix();
      translate(-this.d*(maxX/2),-this.d*(maxY/2),-this.d*(maxZ/2)); //in minus direction to stya in center
      translate(this.px*this.d,this.py*this.d,this.pz*this.d);
      box(this.d*0.9);
    popMatrix();
    }
    else
    {
      if(gameState ==1)
      {
        //fill(color(0,255,255,0.1)); //check
        pushMatrix();
          translate(-this.d*(maxX/2),-this.d*(maxY/2),-this.d*(maxZ/2));
          translate(this.px*this.d,this.py*this.d,this.pz*this.d);
          box(this.d*0.9);
        popMatrix();
      }
    } */
  }
  
  void click(int _id)
  {
    if(_id == this.id)
    {
      this.isLive = !this.isLive;
    }
  }
  
  void check()
  {
    int nLiving = 0;
    int xminus = this.px - 1;
    int xplus =  this.px + 1;
    int yminus = this.py - 1;
    int yplus =  this.py + 1;
    int zminus = this.pz - 1;
    int zplus =  this.pz + 1;
    if(xminus < 0)     xminus = maxX-1;
    if(xplus > maxX-1) xplus = 0;
    if(yminus < 0)     yminus = maxY-1;
    if(yplus > maxY-1) yplus = 0;
    if(zminus < 0)     zminus = maxZ-1;
    if(zplus > maxZ-1) zplus = 0;
    
    if(cells[xminus][this.py][this.pz].isLive) nLiving ++;
    if(cells[xplus][this.py][this.pz].isLive)  nLiving ++;
    if(cells[this.px][yminus][this.pz].isLive) nLiving ++;
    if(cells[this.px][yplus][this.pz].isLive)  nLiving ++;
    if(cells[xminus][yminus][this.pz].isLive)  nLiving ++;
    if(cells[xplus][yplus][this.pz].isLive)    nLiving ++;
    if(cells[xminus][yplus][this.pz].isLive)   nLiving ++;
    if(cells[xplus][yminus][this.pz].isLive)   nLiving ++;
    
    if(cells[xminus][this.py][zminus].isLive) nLiving ++;
    if(cells[xplus][this.py][zminus].isLive)  nLiving ++;
    if(cells[this.px][yminus][zminus].isLive) nLiving ++;
    if(cells[this.px][yplus][zminus].isLive)  nLiving ++;
    if(cells[xminus][yminus][zminus].isLive)  nLiving ++;
    if(cells[xplus][yplus][zminus].isLive)    nLiving ++;
    if(cells[xminus][yplus][zminus].isLive)   nLiving ++;
    if(cells[xplus][yminus][zminus].isLive)   nLiving ++;
    if(cells[this.px][this.py][zminus].isLive)   nLiving ++; // center of grid
    
    if(cells[xminus][this.py][zplus].isLive) nLiving ++;
    if(cells[xplus][this.py][zplus].isLive)  nLiving ++;
    if(cells[this.px][yminus][zplus].isLive) nLiving ++;
    if(cells[this.px][yplus][zplus].isLive)  nLiving ++;
    if(cells[xminus][yminus][zplus].isLive)  nLiving ++;
    if(cells[xplus][yplus][zplus].isLive)    nLiving ++;
    if(cells[xminus][yplus][zplus].isLive)   nLiving ++;
    if(cells[xplus][yminus][zplus].isLive)   nLiving ++;
    if(cells[this.px][this.py][zplus].isLive)   nLiving ++;
    //fill(color(255,100,100));
    
    if(this.isLive)
    {
      //rules for the living
      if(nLiving < 13) //if(nLiving == 2 || nLiving == 3)
      {
        this.nextLive = false; //true
      }
      else
      {
        this.nextLive = true; //false
      }
    }
    else
    {
      //rules for the dead
      if(nLiving >= 14 && nLiving <=19) //if(nLiving == 3 || nLiving ==4)
      {
        this.nextLive = true;
      }
      else
      {
        this.nextLive = false;
      }
    }
    
    //Any live cell with two or three live neighbours survives.
    //Any dead cell with three live neighbours becomes a live cell.
    //All other live cells die in the next generation. Similarly, all other dead cells stay dead.
   
  }
}
