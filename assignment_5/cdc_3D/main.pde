import controlP5.*;
import peasy.*;
import processing.dxf.*;
PeasyCam cam;
ControlP5 bar;
//----------------------------------------------
float tall=250;
int sides = 5;
float R1=200;
float R2=200;
float R3=200;
float R4=200;
float r = 100;
float g = 100;
float b = 100;
float a = 200;

//------------------------------------------------
void setup()
{
  size(1000, 1000, P3D);
  cam = new PeasyCam(this, 2000);
  UI();
}
//------------------------------------------------
void draw()
{
  background(80);
  beginRaw(DXF,"output.dxf");
  noStroke();
  fill(200);
  lightSettings(); 
  drawCylinder();
  UIShow();
  endRaw();
}
//------------------------------------------------
void drawCylinder()
{
  float angle = 0;
  float angleupdate = TWO_PI/sides;
  beginShape(TRIANGLE_STRIP);
  fill(r,g,b,a);
  for(int i=0; i<sides+1 ;i++)
  {
    vertex(R1 * cos(angle), 0, R1 * sin(angle));
    vertex(R1 * cos(angle +angleupdate), 0, R1 * sin(angle + angleupdate));
    vertex(R2 * cos(angle), tall, R2 * sin(angle));
    vertex(R2 * cos(angle+angleupdate), tall, R2 * sin(angle+angleupdate));
    vertex(R1 * cos(angle), 0, R1 * sin(angle));
    vertex(R1 * cos(angle +angleupdate), 0, R1 * sin(angle + angleupdate));
    vertex(R2 * cos(angle), -tall, R2 * sin(angle));
    vertex(R2 * cos(angle+angleupdate), -tall, R2 * sin(angle+angleupdate));


    angle += angleupdate;  
  }
  endShape();

  beginShape(TRIANGLE_STRIP);
  for(int i=0; i<sides+1 ;i++)
  {
    vertex(R3 * cos(angle), 2*tall, R3 * sin(angle));
    vertex(R3 * cos(angle +angleupdate), 2*tall, R3 * sin(angle + angleupdate));
    vertex(R2 * cos(angle), tall, R2 * sin(angle));
    vertex(R2 * cos(angle+angleupdate), tall, R2 * sin(angle+angleupdate));
    angle += angleupdate;  
  }
  endShape();
  
  beginShape(TRIANGLE_STRIP);
  for(int i=0; i<sides+1 ;i++)
  {
    vertex(R4 * cos(angle), -2*tall, R4 * sin(angle));
    vertex(R4 * cos(angle +angleupdate), -2*tall, R4 * sin(angle + angleupdate));
    vertex(R2 * cos(angle), -tall, R2 * sin(angle));
    vertex(R2 * cos(angle+angleupdate), -tall, R2 * sin(angle+angleupdate));
    angle += angleupdate;  
  }
  endShape(CLOSE);
  
}
