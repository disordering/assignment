class Particle{
  PVector dir,vel,pos;
  
  Particle(float x, float y){
    dir = new PVector(0, 0);
    vel = new PVector(0, 0);
    pos = new PVector(x, y);
  }

  void move(){
    float angle = TAU *noise(pos.x/noiseScale, pos.y/noiseScale) *noiseScale;
    dir.x = cos(angle);
    dir.y = sin(angle);
    vel = dir.copy(); 
    vel.mult(len);
    pos.add(vel); 
  }

  void outscreen(){
    if( pos.x< 0 || width < pos.x ||   pos.y < 0||height < pos.y){
      pos.x = random(50, width);
      pos.y = random(50, height);
    }
  }

  void display(float r){
    ellipse(pos.x, pos.y, r, r);
  }
}
