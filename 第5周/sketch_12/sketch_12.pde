PImage img;
int circleNum = 1;//定义起始个数
//--------------------------------------------
void setup()
{  
  img = loadImage("1.png");
  size(1220,682);
  background(255);
  frameRate(1);
}
//--------------------------------------------
void draw()
{
  drawcircle();
}
//--------------------------------------------
void drawcircle() 
{
  for (int i = 0; i < circleNum; i ++) 
  {
    int x = int(random(width));
    int y = int(random(height));
    color c = img.get(x, y);
    fill(c, 100);//取色
    noStroke();
    circle(x, y, random(50));//画圆
  }
  circleNum+=random(10);//个数递增
}
