// N0a4 | Timeline Prodject | 8-28-24
//need 8 histEvent

void setup() {
  size(900, 400);
  background(127);
}

void draw() {
  background(127);
  drawRef();
  histEvent(150, 200, "Z1, 1940", "Germany",true);
  histEvent(300, 300, "Test 2", "Detail 2", false);
  histEvent(450, 400, "

}

void drawRef() {
  strokeWeight(3);
  stroke(50);
  line(100, 250, 800, 250);
  fill(0);

  textSize(18);
  text("1940", 80, 270);
  text("1960", 810, 270);
  textAlign(CENTER);
  textSize(30);
  text("Historic Computer System", width/2, 60);
  textSize(22);
  text("by Noah El Mansouri", width/2, 85);
}

void histEvent(int x, int y, String val, String detail, boolean top) {
  if (top) {
    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }
  fill(200);
  rectMode(CENTER);
  rect(x, y, 80, 20);
  textSize(12);
  fill(0);
  text(val, x, y+6);

  if (mouseX>x-40 && mouseX<x+40 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
