import peasy.*;
PeasyCam cam;


int cellSize =10;
int maxX = 1;
int maxY = cellSize;
int maxZ = cellSize;
Cell[][][] cells = new Cell[maxX][maxY][maxZ];

int gameState = 0; //state of the game 0 = creating world 1 = running it


void setup() {
  size(1200,800,P3D); //for 3dimentions
  cam = new PeasyCam(this, 100);
  
   for(int y=0; y< maxY; y++)
 {
   for(int x=0; x< maxX; x++)
   {
     for(int z=0; z< maxZ; z++)
     {
       cells[x][y][z] = new Cell(x,y,z,cellSize);
     }
   }
 }
}

void draw() {
  background(20);
  //noFill(); //wireframe view for 3D
  fill(10,125,255);
  noStroke(); //base lighting in processig is ambient lighting (every direction)
  lights();
  //rotateX(radians(30));
  //rotateY(radians(15));
  
  for(int y=0; y< maxY; y++)
 {
   for(int x=0; x< maxX; x++)
   {
     for(int z=0; x< maxZ; z++)
     {
       cells[x][y][z].display();
     }
   }
 }
        
  //box(20); 
}
