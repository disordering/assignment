float lineSize = 0;
float colSize = 0;
color[] colors = {#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff
                  ,#000000,#ff0000, #ffff00, #0000ff, #000000};
//-----------------------------
void setup() {
  size(800,500);
  frameRate(1); 
}
//-----------------------------------------
void draw() 
{
  background(#ffffff);
  paint();
}
//------------------------------------------
void paint()
{
  for(int line = 0; line < height; line += lineSize + 3) {
    lineSize = random(9, width/6);
    for(int col = 0; col < width; col += colSize + 3) {
      colSize = random(9, height/3); 
      color rectColor = colors[int(random(colors.length))];
      fill(rectColor);
      rect(col, line, colSize, lineSize);
      strokeWeight(3);
      stroke(#000000);
      float x = col+colSize;
      float y = line+lineSize;
      line(x, line, x, y);
    }
  }
}
