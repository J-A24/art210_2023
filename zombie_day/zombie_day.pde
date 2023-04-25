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

//SPRITE SETUP
Player p;
Awaken a;
Bullet b;
Awaken_Search c;         //click* object
int n = 10;                      //# of falling objects
Object[] z = new Object[n];
int gState = 0;                   //current gamestate
IntDict state = new IntDict();    //defines a gamestate
boolean isHit = false;

//OPTIONS
boolean DEBUG = false;      //display hitboxes


void setup() {
  noStroke();
  size(720, 720, FX2D);
  //fullScreen(FX2D);
  textAlign(CENTER);

  soundPlayer();
  createObjects();
  gameStates();
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


void createObjects() {
  // Create Player
  p = new Player("ANY", new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
  a = new Awaken("ANY", new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
  b = new Bullet("ANY", new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
  c = new Awaken_Search("ANY", new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D(), 40);

  // Create Falling Objects
  for (int i=0; i <n; i++) {
    z[i] = new Object("ANYYY"+i, new PVector(width/2, height/2), new PVector(0, 0), PVector.random2D());
  }
}


void draw () {
  background(255);
  fill(222);
  rect(100, 100, width-200, height-200);

  if (gState == state.get("menu")) {
    background(255, 155, 200);
    fill(255, 0, 0);
    textSize(108);
    text("BEGIN!" + "\npress Q", width/2, height/2);
    // HAND
    a.show();
    a.update();
    a.check();
    // PLAYER
    p.show();
    p.update();
    p.check();
    if (key == 'q') gState = state.get("running");
  }

  if (gState == state.get("running")) {
    // HAND
    a.show();
    a.DEBUG();
    a.update();
    a.check();
    a.DEBUG = DEBUG;
    // CLICK
    c.show();
    c.update();
    c.DEBUG = DEBUG;
    for (int i=0; i <n; i++) {
    c.hit(z, i);
    }
    // BULLET
    b.show();
    b.update();
    b.check();
    b.DEBUG = DEBUG;
    // PLAYER
    p.show();
    p.update();
    p.check();
    p.hitCount(n);            // get # of falling objects
    p.DEBUG = DEBUG;
    // FALLING OBJECTS
    for (int i=0; i <n; i++) {
      z[i].update();
      z[i].show();
      z[i].check(n);
      z[i].DEBUG = DEBUG;
    }
    m.show();
    m.update();
  }

  if (gState == state.get("end")) {
    background(100);
    fill(255, 0, 0);
    textSize(96);
    text("NOPE" + "\npress SPACE to restart", width/2, height/2);
    p.hits = 0;
    if (key == ' ') gState = state.get("menu");

    // RESET HAND
    a.acc = new PVector(0.05,0); 
    a.vel.x = 1.0;

    // RESET CHARACTER
    p.acc = new PVector(0.05,0); 
    p.vel.x = 1.0;

    // RESET OBJECTS
    for (int i=0; i <n; i++) {
      z[i].acc = new PVector(0.00001, 0.03);
      z[i].pos.x = random(100, width -100);
      z[i].pos.y = -45+random(-720*2, 0);
    }
  }
}


void mouseClicked() {
  //TOGGLE HITBOXES
  DEBUG = (DEBUG != true) ? true : false;

  if (m.soundLevel != 0) m.fadeIn();
  else m.fadeOut();

  //if(soundLevel == 0) {
  //  Ani.to(this, .5, "soundLevel", 1);
  //} else {
  //  Ani.to(this, .5, "soundLevel", 0);
  //}

  //if(au.music[0].isPlaying()) {
  //au.env(au.music[0], 0, 0, 1, 1);  //for a fading stop effect
  //au.music[0].pause();
  //} else {
  //au.env.play(au.music[0], 1, 1000000000, 1, 0); //fade back in
  //au.music[0].loop();
  //}
}


void keyPressed() {
  //CHANGE CHAR. DIRECTION
  if (key != 'q') {
    p.acc.x *= -1.0;
    p.vel.x *= -1.0;
    a.acc.x *= -1.0;
    a.vel.x *= -1.0;
  }

  //RELOAD THE GAME
  if (key == 'q') createObjects();
}
