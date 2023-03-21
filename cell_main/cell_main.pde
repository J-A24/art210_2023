int cellSize =10;
int maxX = 0;
int maxY = 0;
Cell[][] cells; //import the class called "cell" & create this grid from it

void setup() {
 size(1200,800);
 maxX= width/cellSize;
 maxX= height/cellSize;
 cells = new Cell[maxX][maxY];

 for(int y=0; y< maxY; y++)
 {
   for(int x=0; x< maxX; x++)
   {
     cells[x][y] = new Cell(x,y,cellSize);
   }
 }
}

void draw () {
  for(int y=0; y< maxY; y++) 
  {
    for(int x=0; x< maxX; x++)
    {
      cells[x][y].display();
    }
  }
}

void mousePressed()
{
  int mx = mouseX;
  int my = mouseY;
  for(int y=0; y< maxY; y++)
  {
    for(int x=0; x< maxX; x++)
    {
      cells[x][y].click(mx,my); //creates void method in cell class
    }
  }
   println(mouseX,";",mouseY);
}
