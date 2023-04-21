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
int n = 300;                      //# of falling objects
Object[] z = new Object[n];
int gState = 0;                   //current gamestate
IntDict state = new IntDict();    //defines a gamestate
IntDict buttons = new IntDict();  //current button

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
    p.show();
    p.update();
    p.check();

    buttons.set(str(key), 1);
    if (key == 'q') gState = state.get("running");
  }

  if (gState == state.get("running")) {
    p.show();
    p.update();
    p.check();
    p.hitCount(n);            // get # of falling objects
    p.DEBUG = DEBUG;
    for (int i=0; i <n; i++) {
      z[i].update();
      z[i].show();
      z[i].check(n);
      z[i].DEBUG = DEBUG;
      m.show();
      m.update();
    }
  }

  if (gState == state.get("end")) {
    background(100);
    fill(255, 0, 0);
    textSize(96);
    text("NOPE" + "\npress SPACE to restart", width/2, height/2);
    p.hits = 0;
    if (key == ' ') gState = state.get("menu");

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
  //FIND KEY
  buttons.set(str(key), 1);

  //CHANGE CHAR. DIRECTION
  if (key != 'q') {
    p.acc.x *= -1.0;
    p.vel.x *= -1.0;
  }

  //RELOAD THE GAME
  if (key == 'q') createObjects();
}
