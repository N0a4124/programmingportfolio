// Noah El Mansouri | Spaceship Game | Nov 6 2024|

int score, level;
boolean play;
Spaceship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rTime, puTime;

void setup() {
  size(500, 500);
  s1 = new Spaceship();
  rTime = new Timer(1000);
  rTime.start();
  puTime = new Timer(5000);
  puTime.start();
  noCursor();
  play = false;
}
void draw() {
  if (!play) {
    startScreen();
  } else {

    background (0);
    stars.add(new Star());
    for (int i = 0; i<stars.size(); i++) {
      Star s = stars.get (i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }

    noCursor();

    if (keyPressed && key == ' ' && s1.fire()) {
      lasers.add(new Laser(s1.x, s1.y));
      s1.laserCount--;
    }
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          //
          score += r.diam;
          lasers.remove(laser);
          r.diam-=10;
          if (r.diam<5) {
            rocks.remove(r);
          }
        }
        laser.display();
        laser.move();
        if (laser.reachedTop()) {
          lasers.remove(laser);
        }
      }
    }
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        s1.health-= rock.diam;
        rocks.remove(rock);
        score += rock.diam;
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }

    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        // Decide what the user receives
        s1.health += 100;
        powups.remove(pu);
        if (pu.type == 'h') {
          s1.health += 100;
          fill(222, 0, 0);
        } else if (pu.type == 'a') {
          s1.laserCount += 100;
          // 3. invicible mode
          // 4. increase turret count
          // 5. visual change to the ship
          // 6. wave to take out all rocks and enemies
          // 7. slow down rocks
          // 8. point bonus
        }
        if (pu.reachedBottom()) {
          powups.remove(pu);
        }
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health < 1) {
      gameOver();
      noLoop();
    }
  }

  infoPanel();
}
void infoPanel() {
  fill(0, 128, 128);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(25);
  text("score"+score, 20, 35);
  text("Health:" + s1.health, 150, 35);
  text("Ammo:" + s1.laserCount, 325, 35);
}

void startScreen() {
  background(0);
  fill(255);
  text("Welcome to SpaceGame", width/2, 300);
  text("Click to start.....", width/2, 350);
  if (mousePressed) {
    play = true;
  }
}
void gameOver() {
  background(0);
  fill(255);
  text("GameOver!", width/2, 300);
  text("Score:", width/2, 350);
}

void ticker() {
}

void mousePressed() {
}
