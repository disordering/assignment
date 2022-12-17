class Branch{
  float radius, ratio;
  PVector position;
  
  Branch(float radius_ , float ratio_, PVector position_){
   radius = radius_;
   ratio = ratio_;
   position = position_;
  }
  
  void drawTree(){
    pushMatrix();
    translate(position.x, position.y);
    float len = getStartLength(radius, ratio);
    branch(len);
    popMatrix();
  }
  
  void branch(float len){
    strokeWeight(len * 0.1);
    strokeCap(ROUND);
    line(0,0,0,-len);
    translate(0,-len);
    
    if(len > 2){
      pushMatrix();
      branch(len * ratio);
      popMatrix();
    
      pushMatrix();
      rotate(angle);
      branch(getStartLength(len,ratio));
      popMatrix();
    
      pushMatrix();
      rotate(ang);
      branch(getStartLength(len,ratio));    
      popMatrix();
    }
  }
  
  
  float getStartLength(float length, float ratio){
    float len = (1 - ratio) * length;
    return len;
  }
}
