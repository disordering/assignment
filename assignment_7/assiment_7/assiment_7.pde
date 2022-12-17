import controlP5.*;
ControlP5 bar;
import peasy.*;
PeasyCam cam;
//-----------------------------
Branch branch;
float radius = 400 ;
float ratio = 0.3 ;
float angle = PI / 3;
float ang = -PI/3;

//----------------------------
void setup(){
  //bar = new ControlP5(this);
  //bar.addSlider("radius", 1, 800, 400, 50, 50, 200, 30);
  //bar.addSlider("ratio", 0, 1, 0.4, 50, 90, 200, 30);
  size(1000,600);
  PVector p = new PVector(width/2,height);
  branch = new Branch(radius,ratio, p);
  
  cam = new PeasyCam(this, 10);
  UI();
}
//------------------------------
void draw(){
  background(0);
  stroke(255);
  branch.drawTree();
  
  UIShow();
}
//--------------------------------
