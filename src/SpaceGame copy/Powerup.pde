class Powerup {
  //member variables
  int x, y, diam, speed;
  char type;
  //PImage pu1;

  //constructor
  Powerup() {
    x = int(random(width));
    y = -200;
    diam= int(random(20, 75));
    speed = int(random(1, 5));
    // r1 = loadImage("powerup1.png");
    int rand = int(random(2));
    if (rand == 0) {
      type = 'h';
      // pu1 = loadImage('health.png');
    } else if (rand == 1) {
      type = 'a';
    }
  }
  void display() {
    fill(127);
    if (type == 'h') {
      fill(0, 222, 0);
    } else if (type == 'a') {
      fill(255, 0, 0);
    }

    ellipse(x, y, diam, diam);
    //r1.resize(diam,diam);
    //image(r1, x, y);
    //missing }
  }

  void move() {
    y = y + speed;
  }
  boolean reachedBottom() {
    if (x < -50) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
