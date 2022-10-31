int canvasLeftCornerX = 30;
int canvasLeftCornerY = 60;

void UI()
{
  bar = new ControlP5(this, createFont("微软雅黑", 14));
  int barSize = 200;
  int barHeight = 20;
  int barInterval = barHeight + 10;
  bar.addSlider("tall", 0, 800,250, canvasLeftCornerX, canvasLeftCornerY, barSize, barHeight).setLabel("高度");
  bar.addSlider("sides", 0, 50, 5, canvasLeftCornerX, canvasLeftCornerY+barInterval, barSize, barHeight).setLabel("边数");
  bar.addSlider("R1", 0, 1000, 200, canvasLeftCornerX, canvasLeftCornerY+barInterval*2, barSize, barHeight).setLabel("R1");
  bar.addSlider("R2", 0, 1000, 200, canvasLeftCornerX, canvasLeftCornerY+barInterval*3, barSize, barHeight).setLabel("R2");
  bar.addSlider("R3", 0, 1000, 200, canvasLeftCornerX, canvasLeftCornerY+barInterval*4, barSize, barHeight).setLabel("R3");
  bar.addSlider("R4", 0, 1000, 200, canvasLeftCornerX, canvasLeftCornerY+barInterval*5, barSize, barHeight).setLabel("R4"); 
  bar.addSlider("r", 0, 255, 180, canvasLeftCornerX, canvasLeftCornerY+barInterval*6, barSize, barHeight).setLabel("R");
  bar.addSlider("g", 0, 255, 255, canvasLeftCornerX, canvasLeftCornerY+barInterval*7, barSize, barHeight).setLabel("G");
  bar.addSlider("b", 0, 255, 255,canvasLeftCornerX, canvasLeftCornerY+barInterval*8, barSize, barHeight).setLabel("B");
  bar.addSlider("a", 255,0,200,canvasLeftCornerX, canvasLeftCornerY+barInterval*9, barSize, barHeight).setLabel("透明度");
  bar.setAutoDraw(false);
}
//---------------------------------------------------------------
void UIShow() 
{
  cam.beginHUD();
  lights();
  bar.draw();
  cam.endHUD();
  
  if(mouseX<300&&mouseY<height/2)
    cam.setActive(false);
  else
    cam.setActive(true);
}
//-------------------------------------------------------------------
void lightSettings() 
{
  lightSpecular(255, 255, 255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  specular(200, 200, 200);
  shininess(15);
}
