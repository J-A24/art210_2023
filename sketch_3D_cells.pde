import peasy.*;
import picking.*;
PeasyCam cam;
Picker picker;

int cellSize = 15;
int maxX = 5;
int maxY = 5;
int maxZ = 5;
Cell[][][] cells = new Cell[maxX][maxY][maxZ];

int gameState = 0; //state of the game 0 = creating world 1 = running it


void setup() {
  size(1200,800,P3D); //for 3dimentions
  picker = new Picker(this);
  cam = new PeasyCam(this, 300);
  int cellCounter = 0;
  
  for(int y=0; y< maxY; y++)
  {
   for(int x=0; x< maxX; x++)
   {
     for(int z=0; z< maxZ; z++)
     {
       cells[x][y][z] = new Cell(x,y,z,cellSize,cellCounter);
       cellCounter++;
     }
   }
 }
}

void draw() {
  cam.getState().apply(picker.getBuffer());
  background(20);
  //noFill(); //wireframe view for 3D
  noStroke(); //base lighting in processig is ambient lighting (every direction)
  lights();
  rotateX(radians(30));
  rotateY(radians(15));
  
  for(int y=0; y< maxY; y++)
  {
   for(int x=0; x< maxX; x++)
   {
     for(int z=0; z< maxZ; z++)
     {
       //picker.start([x][y][z].id);
       cells[x][y][z].display();
     }
   }
 }
}

void mousePressed() 
{
  int id = picker.get(mouseX, mouseY);
  for(int y=0; y< maxY; y++)
 {
   for(int x=0; x< maxX; x++)
   {
     for(int z=0; z< maxZ; z++)
     {
       cells[x][y][z].click(id);
     }
  println(id);
   }
 }
}
