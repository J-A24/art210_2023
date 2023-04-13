import processing.sound.*;
//import de.looksgood.Ani.*;

TriOsc triOsc;
Env env;
float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 1.4;
audio au;



Bob s;
int n = 20;
Object[] z = new Object[n];

boolean test = false;       //to allow when clicking if testing hitboxes display

void setup() {
  noStroke();
  size(720,720);
  textAlign(CENTER);
  textSize(128);
  
  au = new audio(this, "x.mp3");
  au.music();
  
   
  s = new Bob("ANY", new PVector(width/2,height/2), new PVector(0,0), PVector.random2D());
  for(int i=0; i <n; i++) {
     z[i] = new Object("ANYYY"+i, new PVector(width/2,height/2), new PVector(0,0), PVector.random2D());
  }  
}

void draw () {
  background(255);
  fill(222);
  rect(100,100,width-200,height-200);
  
  s.show();
  s.update();
  s.check(n);      //to check collion of the objects
  s.test = test;          
  
  for(int i=0; i <n; i++) {
    z[i].update();
    z[i].show();
    z[i].check();
    z[i].test = test;
   } 
   
   au.show();
   au.update();
   au.check();
}

void mouseClicked() {
  if(test != true) test = true; 
  else test = false;
  
  if(soundLevel == 0) {
    Ani.to(this, .5, "soundLevel", 1);  
  } else {
    Ani.to(this, .5, "soundLevel", 0);
  }
  
  //if(au.music[0].isPlaying()) {
    //au.env(au.music[0], 0, 0, 1, 1);  //for a fading stop effect
    //au.music[0].pause();
  //} else {
    //au.env.play(au.music[0], 1, 1000000000, 1, 0); //fade back in
    //au.music[0].loop(); 
  //}
}

void keyPressed() {
  s.acc.x *= -1.0; 
  s.vel.x *= -1.0; 
}
