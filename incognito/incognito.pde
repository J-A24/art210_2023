import processing.javafx.*;
import processing.sound.*;
import de.looksgood.ani.*;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*                                     
                                             INCGNITO
                  // OBJECTIVE //
                  - complete 3-7 minigames accumulating pints from each game
                  - if you survice you win (nothing)
                  
                  // HOW-TO-PLAY //
                  - Q: beings game
                  - R: resets game from the start emnu
                  - E: ???
                  - SPACE: rest game if DEAD
                  - After all the miningames have been survived you will be taken to a score screen -  yes
                  
                  // MINIGAMES //
                  - HIT GAME
                    - you have 20 seconds to collect as many points as possible
                    - your play is weak to black apples and can survive a maximum of 5 hits before DEAD
                    - use the cursor to hover over a black apple to color them and gain +1 point/
                    - avoid the magenta/purple bullet things on the edge of the screen else instant DEAD
                    - use the cursor to hover over a golden duck to "multply" your points - but be carful
                  - HIDE GAme
                    - [N/A]
                  - Quiz Game
                    - [N/A]
                  - Shoot 'Em Up
                    - [N/A] 
                  - Puzzle Game
                    - [N/A]
                  - Painting Game
                    - [N/A]
                  - ??? Game
                    - [N/A]
*/
///////////////////////////////////////////////////////////////////////////////////////////////////////////////



//SOUND SETUP
TriOsc triOsc;
Env env;
float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 1.4;
sound m;

// SCENE SETUP
int maxGround;              
scene[] bg = new scene[128];     //limit of bg that can be create in CreateObjects

// SPRITE SETUP
Player p;
Awaken a;
int nn = 2;                      // # of bullets
Bullet[] b = new Bullet[nn];
Awaken_Search c;                 // click * object
int n = 19;                      // # of objects later divide with by width for total # of objects
Object[] z;

// GAMESTATE SETUP
int gState;                       // current gamestate
IntDict state = new IntDict();    // defines a gamestate
int mGame;                        // current minigame played
IntDict game = new IntDict();     // defines a minigame

int tPoint;                    // total # of points         

// WRITER SETUP
writer w;
int testWord = 1;                    // get index from list

// OPTIONS
boolean iDEBUG = false;             // display hitboxes
int ms;                             // holds current ms run time
int timer;                     /////////////////////////////////// time left in a minigame
int iDUCK = 0;                 /////////////////////////////////// if (1) enables duck mode
int gameLength = 20;           /////////////////////////////////// set mini game duration in seconds

// For FUn
boolean shoot = false;         // can shoot with awaken search
float tempX,tempY;
String tempWord = "Click*";


void setup() {
  noStroke();
  cursor(CROSS);
  //size(720, 720, FX2D);
  fullScreen(FX2D);

  n = int(width/n);
  z = new Object[n];
  w = new writer();
  tPoint = 0;

  gState = 0;
  mGame = 0;
  
  soundPlayer();
  createObjects();
  gameStates();
  gameSelect();
  textSetup();
}


void soundPlayer() {
  // PLay this
  m = new sound(this, "music.wav");

  // Create triangle wave
  triOsc = new TriOsc(this);

  // Create the envelope
  env  = new Env(this);
}

void textSetup() {
  fill(255, 0, 0);
  textSize(108);
  textAlign(CENTER);
  //PFont load;
  //load = loadFont("LetterGothicStd.otf");
  //textFont(load);
}

void gameStates() {
  state.add("menu", 0);
  state.add("running", 1);
  state.add("end", 2);
  state.add("win", 3);
}

void gameSelect() {
  game.add("hide", 0);        // goal: to avoid being hit
  game.add("hit", 1);         // goal: hit every object
}

void createObjects() {
  // Create Player
  p = new Player("ANY", new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
  a = new Awaken("ANY", new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
  for(int j=0; j<nn; j++) {
    b[j] = new Bullet("ANY", new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
  }
  c = new Awaken_Search("ANY", new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D(), 40);

  // Create Falling Objects
  for (int i=0; i <n; i++) {
    z[i] = new Object("ANYYY"+i, new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
  }
  
  // Create Background
  maxGround = ceil(width/(126.0/1.7))+1;   //# is width of image then divided by # for overlap
  //println(maxGround);
   bg[0] = new scene("any", new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
  for(int k = 0; k <maxGround; k++) {
    bg[k] = new scene("any", new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
     //println(bg[k].pos.x);
      bg[k].pos.x = k *(126/1.7);      //# is width of image then divided by 2 for overlap
      bg[k].pos.y = height-58;
  }
}

void miniGame() {
  if (mGame == game.get("hide")) {
    //do game 1
  } if (mGame == game.get("hit")) {
    //do game 2
  }
}

void draw () {
  background(115, 78, 159);
  fill(146, 79, 158);
  rect(100, 100, width-200, height-200);
  
  // WRITER
    //String v = w.word();
    //println(v);
  
//////////////////////////////////////////////////////////////////////////////////////////////////
  if (gState == state.get("menu")) {
    cursor(CROSS);
    background(216, 22, 142);
    iDEBUG = false;      // display hitboxes begin game as "hidden"
    iDUCK = 0;
    
    // TEXT
    textSize(92);
    fill(0);
    text("BEGIN!" + "\npress Q", width/2, height/2);
    
    // RESET HAND
    //a.acc = new PVector(0.05,0); 
    //a.vel.x = 1.0;

    // RESET CHARACTER
    //p.acc = new PVector(0.05,0); 
    //p.vel.x = 1.0;
    
    // BULLET
    for (int j=0; j <nn; j++) {
      b[j].side = int(random(2));
      //println(b[j].side);
      b[j].pos.y = 125;
    }

    // RESET OBJECTS
    for (int i=0; i <n; i++) {
      z[i].acc = new PVector(0.00001, 0.03);
      z[i].pos.x = random(100, width -100);
      z[i].pos.y = -45+random(-720*2, 0);
      z[i].vel.x = 0;
      z[i].vel.y = 0;
      z[i].acc.y = random(0.005,0.05);
      z[i].rotate = 90.0 + z[i].pos.x;           
      z[i].object = int(random(0,99));             
      z[i].curA = (z[i].object == 0) ? 1 : 0;  
      z[i].scale = 0.2;
    }
    
    // HAND
    a.show();
    a.update();
    a.check();
    
    // CLICK
    shoot = false;
    
    // PLAYER
    p.show();
    p.update();
    p.check();
    p.hits = 0;
    
    // Points
    tPoint = 0;
    
    // TIMER
    ms = millis();
    if (key == 'Q') gState = state.get("running");
  }
//////////////////////////////////////////////////////////////////////////////////////////////////
  if (gState == state.get("running")) {
    key = '_';          //Make sure is not "space" or other used key
    // BACKGROUND
    for (int i=0; i <maxGround; i++) {
      frameRate(random(2));
      bg[i].show();
      bg[i].iDEBUG = iDEBUG;
    }
    frameRate(random(60));
    
    // TIME
    fill(0);
    textSize(42);
    timer = millis() - ms;
    text(millisAsTimer(timer), 140, height-24);
    
    // Points
    text(tPoint, width-140, height-24);
    
    // HAND
    noCursor();
    a.show();
    a.DEBUG();
    a.update();
    a.check();
    a.iDEBUG = iDEBUG;
    
    // BULLET
    for (int j=0; j <nn; j++) {
      b[j].show();
      b[j].update();
      b[j].check();
      b[j].iDEBUG = iDEBUG;
      b[j].hitPlayer();
    }
    
    // PLAYER
    p.show();
    p.update();
    p.check();
    p.hitCount(n, nn);            // get # of falling objects
    p.iDEBUG = iDEBUG;
    
    // FALLING OBJECTS
    for (int i=0; i <n; i++) {
      z[i].update();
      z[i].show();
      z[i].check(n);
      z[i].iDEBUG = iDEBUG;
    }
    
    // CLICK
    frameRate(random(24));
    c.show();
    frameRate(60);
    c.update();
    c.iDEBUG = iDEBUG;
    for (int i=0; i <n; i++) {
      c.hit(z);
    }
    
    m.show();
    m.update();
  }
//////////////////////////////////////////////////////////////////////////////////////////////////
  if (gState == state.get("end")) {
    cursor(CROSS);
    background(100);
    fill(255, 0, 0);
    textSize(72);
    fill(216, 22, 142);
    text("DEAD" + "\npress SPACE to restart", width/2, height/2);
    if (key == ' ') gState = state.get("menu");
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////
  if (gState == state.get("win")) {
    background(146, 79, 158);
    fill(255, 0, 0);
    textSize(72);
    fill(216, 22, 142);
    text("Good Job?" + "\npress SPACE to restart" + "\nScore: " + tPoint, width/2, height/2);
    
    // CLick
    shoot = true;                //if ture can click and place object/text
    fill(115, 78, 159);
    text(tempWord, tempX, tempY);
    
    // HAND
    a.show();
    a.update();
    a.check();
    
    // PLAYER
    p.show();
    p.update();
    p.check();
    
    // CLICK again
    c.show();
    c.update();
    if (key == ' ') gState = state.get("menu");
  }
}


void mouseClicked() {
  //TOGGLE HITBOXES
  iDEBUG = (iDEBUG != true) ? true : false;

  if (m.soundLevel != 0) m.fadeIn();
  else m.fadeOut();
  
  if(shoot ==true) {  
    tempX = mouseX;
    tempY = mouseY;
    tempWord = w.word();        //place the text
  }
}


void keyReleased() {
  //CHANGE CHAR. DIRECTION
  if (key != 'Q' && key != 'R' && key !='E') {
    // PLAYER
    p.acc.x *= -1.0;
    p.vel.x *= -1.0;
    // HAND
    a.acc.x *= -1.0;
    a.vel.x *= -1.0;
  }
  //RELOAD THE GAME
  if (key == 'R') {
    gState = state.get("menu");
  }
  
  //DUCKS
  if (key == 'E') {     
    iDUCK = (iDUCK == 0) ? 1 : 0;
    //println(iDUCK);
  }
}

String millisAsTimer(int millis) {     //I got this from Autumn
  int seconds = floor(millis / 1000);
  int minutes = floor(seconds / 60);
  int remainSeconds = seconds % 60;
  String paddedSeconds = remainSeconds < 10 ? "0" + str(remainSeconds) : str(remainSeconds);
  if(seconds >= gameLength) gState = state.get("win");                                   /////////////////////////////////////// Survice 20 seconds to win!
  return str(minutes) + ":" + paddedSeconds;
}
