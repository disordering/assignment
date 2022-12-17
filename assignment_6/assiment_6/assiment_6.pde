float g = 0.4;
int moverNum = 1000;
Mover[] mover = new Mover[moverNum];
float c;
//------------------------------------------
void setup(){
  size(600,600);
  background(255);
  fill(0);
  smooth();
  
  for(int i = 0; i < moverNum; i++){
    mover[i] = new Mover(random(0.1,2),random(width),random(height));
  }
}
//------------------------------------------
void draw(){
  //background(255);
  background(255,20);
  for(int i = 0; i < moverNum; i++){
    for(int j = 0; j < moverNum; j++){
      if (i != j){
        PVector force = mover[j].attract(mover[i]);
        mover[i].applyForce(force);
        
        //PVector d = PVector.sub( mover[i].location, mover[j].location);
        //float z = d.mag();
        //if( z <= 15 ){
        //  mover[i].velocity.add(mover[i].location.sub(mover[j].location));
        //  mover[j].velocity.add(mover[i].location.sub(mover[j].location));
        //  mover[i].velocity.mult(0.004);
        //  mover[j].velocity.mult(0.004);
        //}        
      }  
    }
    mover[i].run();
  }
}
