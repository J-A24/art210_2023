import processing.sound.*;
Amplitude amp;
AudioIn in;

FFT fft;
int bands = 512;
float[] spectrum = new float[bands];

void setup() {
  size(720, 1024);
  strokeWeight(2);
  fill(255,200,200);

  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
  in = new AudioIn(this, 0); //default mic is usually 0
  
  // start the Audio Input
  in.start();
  
  amp.input(in);
  
  
  
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  
  // patch the AudioIn
  fft.input(in);
}      

void draw() {
  background(255);
  circle(width/2, height/2, (amp.analyze()*1000)+50);
  
  fft.analyze(spectrum);
  
  for(int i = 1; i < bands-1; i++){
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  pushMatrix();
     //translate(bands/2, height/2);
     rotate(tan(PI*i));
     fill(map(mouseX, 0, 100, spectrum[i]*height*40, 100), 200, 200);
     ellipse(i+(width/8), 800, spectrum[i]*height*5, spectrum[i]*height*5 );
   popMatrix();
  } 
}
