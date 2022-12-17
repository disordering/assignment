int res = 50;   // 格子的宽度

//-----------------------------------

void setup() 
{ 
  size(600, 600); 
  noFill(); 
  stroke(255); 
  background(0); 
  frameRate(1); 
} 
 
 //----------------------------------
 
void draw() 
{ 
  background(0); 
  for(int i=0; i<height; i+=res) 
  { 
    for(int j=0; j<width; j+=res)//造i行j列个格子
    {
      int r = int(random(2));
      if(r == 0) 
        line(j, i,j+res,i+res); //左上到右下的对角线
      else if (r == 1) 
        line(j, i+res,j+res,i); //右上到左下的对角线            
    } 
  } 
} 
