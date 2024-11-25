class Spaceship {
  //member variables
  int x, y, w, health, laserCount, turretCount;
  //constructor
  Spaceship() {
    x=width/2;
    y=height/2;
    w=100;
    health = 100;
    laserCount = 100;
    turretCount = 1;
    //ship =
  }
  void display() {
    fill(0, 128, 128);
    triangle(x, y-40, x+35, y+40, x-35, y+40);
    fill(255, 5, 5);
    triangle(x, y-30, x+7, y-10, x-6, y-10);
    ellipse(x-22, y+30, 15, 15);
    ellipse(x-22, y+30, 15, 15);
  }


  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(r.x, r.y, x, y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
