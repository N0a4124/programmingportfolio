// Noah El Mansouri | Conversion App | 23 Sept 2024

void setup() {
  size(400, 200);
}

void draw() {
  background(127);
  line(0, 150, width, 150);
  for (int i=0; i<width + 10; i+=50) {
    line(i, 145, i, 155);
    textAlign(CENTER);
    text(i-200,i,140);
  }
  ellipse(mouseX,150,8,8);
  text(mouseX-200,mouseX,200);
  
  text("Cel" + farToCel(mouseX-200),width/2,100);
  text("Far" + celToFar(mouseX-200),width/2,80);

}

float farToCel(float tempFar) {
  tempFar = (tempFar-32) * (5.0/9.0);
  return tempFar;
}

float celToFar(float tempCel) {
 tempCel = (tempCel * 9/5) + (32);
  return tempCel;
}
