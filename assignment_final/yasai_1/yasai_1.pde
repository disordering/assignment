import controlP5.*;
ControlP5 bar;
import peasy.*;
PeasyCam cam;

float nums =200;
Particle[]  p1 = new Particle[400];
Particle[]  p2 = new Particle[400];
Particle[]  p3 = new Particle[400];

float len = 0.3;
float noiseScale = 800;

void setup(){
  size(600,600);
  background(21, 8, 50);
  
  for(int i = 0; i < nums; i++){
    p1[i] = new Particle(random(0, width),random(0,height));
    p2[i] = new Particle(random(0, width),random(0,height));
    p3[i] = new Particle(random(0, width),random(0,height));
  }
  
  cam = new PeasyCam(this, 10);
  UI();
}

void draw(){
  noStroke();
  for(int i = 0; i < nums; i++){
    float radius = 1;
    float alpha = map(i,0,nums,0,250);
  
    fill(69,33,124,alpha);
    p1[i].move();
    p1[i].display(radius);
    p1[i].outscreen();
  
    fill(7,153,242,alpha);
    p2[i].move();
    p2[i].display(radius);
    p2[i].outscreen();
  
    fill(255,255,255,alpha);
    p3[i].move();
    p3[i].display(radius);
    p3[i].outscreen();
  }  
  UIShow();
}
