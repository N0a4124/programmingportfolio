class Laser {
  //member variables
  int x, y, w, h, speed;
  PImage l1;

  //constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w=5;
    h=10;
    speed=3;
    l1 = loadImage("l1.png");
  }
  void display() {
    image(l1, x, y);
  }


  void move() {
    y = y - speed;
  }



  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<20) { // refine collision
      return true;
    } else {
      return false;
    }
  }


  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }
}
