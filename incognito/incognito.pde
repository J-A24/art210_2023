import processing.javafx.*;
import processing.sound.*;
import de.looksgood.ani.*;

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
scene[] bg = new scene[24];    //limit of bg that can be create in CreateObjects

// SPRITE SETUP
Player p;
Awaken a;
int nn = 2; 
Bullet[] b = new Bullet[nn];
Awaken_Search c;                 // click * object
int n = 10;                      // # of falling objects
Object[] z = new Object[n];

// GAMESTATE SETUP
int gState = 0;                   // current gamestate
IntDict state = new IntDict();    // defines a gamestate
IntDict game = new IntDict();     // defines a minigame
boolean isHit = false;
int tPoint =0;                    //total # of points

// WRITER SETUP
writer w;
int testWord = 1;                    // get index from list

// OPTIONS
boolean iDEBUG = false;      // display hitboxes


void setup() {
  noStroke();
  cursor(CROSS);
  size(720, 720, FX2D);
  //fullScreen(FX2D);
  textAlign(CENTER);
  w = new writer();

  soundPlayer();
  createObjects();
  gameStates();
  gameSelect();
}


void soundPlayer() {
  // PLay this
  m = new sound(this, "music.wav");

  // Create triangle wave
  triOsc = new TriOsc(this);

  // Create the envelope
  env  = new Env(this);
}


void gameStates() {
  state.add("menu", 0);
  state.add("running", 1);
  state.add("end", 2);
}

void gameSelect() {
  game.add("run", 0);        //goal: to avoid being hit
  game.add("running", 1);    //goal: hit every object
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
  maxGround = ceil(width/525.0)+1;   //1001 is size of image
  println(maxGround);
   bg[0] = new scene("any", new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
  for(int k = 0; k <maxGround; k++) {
    bg[k] = new scene("any", new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
     println(bg[k].pos.x);
      bg[k].pos.x = k *525;
      bg[k].pos.y = height-58;
  }
}

void miniGame() {
  
}

void draw () {
  background(255);
  fill(222);
  rect(100, 100, width-200, height-200);
  // WRITER
  String v = w.word();
  println(v);
//////////////////////////////////////////////////////////////////////////////////////////////////
  if (gState == state.get("menu")) {
    cursor(CROSS);
    background(255, 155, 200);
    fill(255, 0, 0);
    textSize(108);
    text("BEGIN!" + "\npress Q", width/2, height/2);
    
    // RESET HAND
    //a.acc = new PVector(0.05,0); 
    //a.vel.x = 1.0;

    // RESET CHARACTER
    //p.acc = new PVector(0.05,0); 
    //p.vel.x = 1.0;

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
    // PLAYER
    p.show();
    p.update();
    p.check();
    if (key == 'Q') gState = state.get("running");
  }
//////////////////////////////////////////////////////////////////////////////////////////////////
  if (gState == state.get("running")) {
    key = '_';          //Make sure is not "space" or other used key
    // BACKGROUND
    for (int i=0; i <maxGround; i++) {
      bg[i].show();
      bg[i].iDEBUG = iDEBUG;
    }
    
    // TIME
    text(v, 60, 40);
    
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
    }
    
    // PLAYER
    p.show();
    p.update();
    p.check();
    p.hitCount(n);            // get # of falling objects
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
    textSize(96);
    text("NOPE" + "\npress SPACE to restart", width/2, height/2);
    p.hits = 0;
    if (key == ' ') gState = state.get("menu");
  }
}


void mouseClicked() {
  //TOGGLE HITBOXES
  iDEBUG = (iDEBUG != true) ? true : false;

  if (m.soundLevel != 0) m.fadeIn();
  else m.fadeOut();
}


void keyPressed() {
  //CHANGE CHAR. DIRECTION
  if (key != 'Q' && key != 'R') {
    p.acc.x *= -1.0;
    p.vel.x *= -1.0;
    a.acc.x *= -1.0;
    a.vel.x *= -1.0;
  }
  //RELOAD THE GAME
  if (key == 'R') {
    gState = state.get("menu");
  }
}

String millisAsTimer(int millis) {     //I got this from Autumn
  int seconds = floor(millis / 1000);
  int minutes = floor(seconds / 60);
  int remainSeconds = seconds % 60;
  String paddedSeconds = remainSeconds < 10 ? "0" + str(remainSeconds) : str(remainSeconds);
  return str(minutes) + ":" + paddedSeconds;
}
