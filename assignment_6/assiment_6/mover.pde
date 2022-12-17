class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;  
  
  float s = random(0.05,0.2);
  float tailStep = 0, tailSpeed = random(2,3);
  
  float sx = -90, sy = 0;
  float ax = -40, ay = 0;
  float bx = 5, by = 40;
  float cx = -40, cy = 0;
  float dx = 5, dy = -40;
  float ex = 10, ey = 0;
 
  float animOff = random(TWO_PI);
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    //distance = constrain(distance,5.0,25.0);
    force.normalize();
    float strength = (g * mass * m.mass) / (distance * distance);
    if(distance > 15){
    force.mult(strength);
    }else if(distance <=15)
    {force.mult(-strength);
    }
    return force;
  }
  
  Mover(float m, float x, float y){
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
//------------------------------------
  void run(){
    display();
    update();
    checkEdge();
  }
//------------------------------------
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
//-------------------------------------
  void display(){
    //drawFish();
    noStroke();
    circle(location.x,location.y,random(0.2,5));
  }
//-------------------------------------
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    this.tailStep += this.tailSpeed;
    
    velocity.add((noise( location.x*.01 - PI,location.y*.01, millis()*.00002  )*2-1  )*.3,
    (  noise( location.x*.01 - PI,location.y*.01, millis()*.00002  )*2-1  )*.3);
    velocity.x = constrain(velocity.x, -2,2);
    velocity.y = constrain(velocity.y, -2,2);
      
  }
//------------------------------------
  void checkEdge(){
    if (location.x > width) {
      location = new PVector(0 , random(height));
    } else if (location.x < 0) {
      location = new PVector(width , random(height));
    }
    if (location.y > height) {
      location = new PVector(random(width) , 0);
    }    
    if (location.y < 0) {
      location = new PVector(random(width) , height);
    }
  }
//-----------------------------------
  void drawFish(){
    sy = 60*sin( this.tailStep*.1 + this.animOff);
    pushMatrix();
    translate(location.x, location.y);
    scale(this.s,this.s);
    rotate( atan2(velocity.y, velocity.x) );
 
    bezier( this.sx,this.sy, this.ax,this.ay, this.bx,this.by, this.ex,this.ey );
    bezier( this.sx,this.sy, this.cx,this.cy, this.dx,this.dy, this.ex,this.ey );
    //strokeWeight(3);
    line( this.sx,this.sy, this.ex,this.ey);
 
    //line(0,0,this.xv*3,this.yv*3);//,3,3);
    popMatrix();
  }
}
