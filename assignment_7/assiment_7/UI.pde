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
  bar.addSlider("radius", 1, 800,400, canvasLeftCornerX, canvasLeftCornerY, barSize, barHeight).setLabel("高度");
  bar.addSlider("ratio", 0.1, 1, 0.5, canvasLeftCornerX, canvasLeftCornerY+barInterval, barSize, barHeight).setLabel("比率");
  bar.addSlider("ang", 0, PI, 0, canvasLeftCornerX, canvasLeftCornerY+barInterval*2, barSize, barHeight).setLabel("角度1");  
  bar.addSlider("angle", 0, -PI, 0, canvasLeftCornerX, canvasLeftCornerY+barInterval*3, barSize, barHeight).setLabel("角度2");
  bar.setAutoDraw(false);
}

void UIShow() {
  cam.beginHUD(); 
  bar.draw();
  cam.endHUD();
}
