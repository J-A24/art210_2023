import peasy.*;
import picking.*;
PeasyCam cam;
Picker picker;

int cellSize =5;
int maxX = 50;
int maxY = 50;
int maxZ = 50;
Cell[][][] cells = new Cell[maxX][maxY][maxZ];

int gameState = 0; //state of the game 0 = creating world 1 = running it


void setup() {
  size(1200,1000,P3D); //for 3dimentions
  //frameRate(24);
  
  picker = new Picker(this); //this - to become part of your own code
  cam = new PeasyCam(this, 500); //300 is son startup cam distance
  int cellCounter = 0;
  
  for(int y=0; y< maxY; y++)
  {
   for(int x=0; x< maxX; x++)
   {
     for(int z=0; z< maxZ; z++)
     {
       cells[x][y][z] = new Cell(x,y,z,cellSize,cellCounter);
       if(random(0,1) >.5) cells[x][y][z].isLive = true; //roughly half cells are created are alive
       cellCounter++;
     }
   }
 }
}

void draw() {
  cam.getState().apply(picker.getBuffer());
  background(255);
  //noFill(); //for the wireframe view for 3D
  noStroke(); //base lighting in processig is ambient lighting (every direction)
  spotLight(50, 100, 200, mouseX, mouseY, 240, -1, 0, 0, PI/1.5, .1);
  rotateX(radians(30));
  rotateY(radians(15));
  
  for(int y=0; y< maxY; y++)
  {
     for(int x=0; x< maxX; x++)
     {
       for(int z=0; z< maxZ; z++)
       {
         picker.start(cells[x][y][z].id);
         cells[x][y][z].display();
         cells[x][y][z].check();
       }
    }
  }
  if(gameState ==1)
  {
    for(int y=0; y< maxY; y++)
  {
     for(int x=0; x< maxX; x++)
     {
       for(int z=0; z< maxZ; z++)
       {
         cells[x][y][z].isLive = cells[x][y][z].nextLive;
       }
      }
    }
  }
}


void keyPressed()
{
 if(gameState ==1) gameState=0;
 else {
  gameState =1; 
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
   }
 }
  println(id);
}
