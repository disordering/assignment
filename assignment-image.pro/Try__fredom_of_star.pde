XiaoQiu[] xqs = new XiaoQiu[10000];
//-------------------------------
void setup()
{
 size(800,800); 
 colorMode(HSB,360,100,100);
 for(int i = 0;i<xqs.length; i++)
 {
   xqs[i] = new XiaoQiu(new PVector(random(0,width),random(0,height)),random(0,5));
 }
}
//--------------------------------
void draw()
{
  noStroke();
  fill(0,20);
  rect(0,0,width,height);
  for(int i = 0;i<xqs.length;i++)
  {
    xqs[i].update();
    xqs[i].display();
  }
}
//--------------------------------
class XiaoQiu
{
  PVector loc;
  float vx,vy;
  float r;  
  float angle = noise(1,100);
  //float R,G,B;
  float c;
  boolean bianxiao = true;
  XiaoQiu(PVector location, float r)
  {
    loc = location;
    this.r = r;  
    //R=map(loc.x,0,width,0,255);
    //G=map(loc.y,0,height,0,255);
    //B=map(loc.x,0,width,255,0);
    c = map(loc.x,0,width,0,360);
  }
  
    void update()
    {
      angle += 0.02*noise(0.001*loc.x,0.001*loc.y);
      vx = 1*sin(angle);
      vy = 1*cos(angle);
      //vx=10*noise(loc.x,loc.y);
      //vy=10*noise(loc.x,loc.y);
      loc.x +=vx;
      loc.y +=vy;
      
      if(bianxiao) r-=0.01;
      if(r<0) bianxiao = false;
      if(!bianxiao) r+=0.01;
      if(r >5) bianxiao = true;
    }
    
    void display()
    {
      noStroke();
      //fill(R,G,B);
      fill(c%360,100,100);
      ellipse(loc.x,loc.y,r,r);
    }
    
    void check()
    {
    }

}
