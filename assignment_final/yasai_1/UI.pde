int canvasLeftCornerX = 30;
int canvasLeftCornerY = 60;

void s1() {
  size(500, 500);
  cam = new PeasyCam(this,500);
  UI();
}

void d1() {
  background(51);
  UIShow();
}

void UI() {
  bar = new ControlP5(this, createFont("微软雅黑", 14));
  int barSize = 100;
  int barHeight = 10;
  int barInterval = barHeight + 10;
  bar.addSlider("radius", 0.1, 10,1, canvasLeftCornerX, canvasLeftCornerY, barSize, barHeight).setLabel("radius");
  //bar.addSlider("nums", 100, 400, 200, canvasLeftCornerX, canvasLeftCornerY+barInterval, barSize, barHeight).setLabel("比率");
  bar.addSlider("len", 0, 1, 0.3, canvasLeftCornerX, canvasLeftCornerY+barInterval*2, barSize, barHeight).setLabel("vel");  
  bar.addSlider("noiseScale", 400, 1600, 800, canvasLeftCornerX, canvasLeftCornerY+barInterval*3, barSize, barHeight).setLabel("noise");
  bar.setAutoDraw(false);
}

void UIShow() {
  cam.beginHUD(); 
  bar.draw();
  cam.endHUD();
}
