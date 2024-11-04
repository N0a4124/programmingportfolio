// Noah El Mansouri | Calc project | Oct 2
Button[] buttons = new Button[22];
String dVal= "0";
char opp;
float l, r, result;
boolean left;

void setup() {
  size(210, 250);
  background(50);
  left = true;
  opp = ' ';
  l = 0.0;
  r = 0.0;
  result = 0.0;
  buttons[0] = new Button(40, 230, 65, 25, "0", true);
  buttons[4] = new Button(25, 150, 30, 25, "4", true);
  buttons[7] = new Button(25, 190, 30, 25, "7", true);
  buttons[2] = new Button(65, 110, 30, 25, "2", true);
  buttons[1] = new Button(25, 110, 30, 25, "1", true);
  buttons[5] = new Button(65, 150, 30, 25, "5", true);
  buttons[8] = new Button(65, 190, 30, 25, "8", true);
  buttons[3] = new Button(105, 110, 25, 25, "3", true);
  buttons[6] = new Button(105, 150, 30, 25, "6", true);
  buttons[9] = new Button(105, 190, 30, 25, "9", true);
  buttons[10] = new Button(25, 70, 30, 25, "C", false);
  buttons[12] = new Button(105, 230, 30, 25, ".", false);
  buttons[13] = new Button(145, 110, 30, 25, "x", false);
  buttons[11] = new Button(85, 70, 70, 25, "±", false);
  buttons[14] = new Button(145, 150, 30, 25, "÷", false);
  buttons[15] = new Button(145, 190, 30, 25, "-", false);
  buttons[16] = new Button(145, 230, 30, 25, "+", false);
  buttons[17] = new Button(185, 210, 30, 65, "=", false);
  buttons[18] = new Button(185, 110, 30, 25, "π", false);
  buttons[19] = new Button(185, 150, 30, 25, "√", false);
  buttons[20] = new Button(185, 70, 30, 25, "BS", false);
  buttons[21] = new Button(145, 70, 30, 25, "%", false);
}

void draw() {
  background(50);
  //println("Left:" + l + " Opp;" + opp +" Right:" + r + " Result:" + result + "left:" + left);
  fill(0, 255, 255);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  fill(255);
  rect(width/2, 25, 190, 30);
  fill(0);
  if (dVal.length()<17) {
    textSize(20);
  } else if (dVal.length() < 21) {
    textSize(20);
  }
  textAlign(RIGHT);
  text(dVal, width-50, 25);
}

void mousePressed() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length() < 20) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        l = float(dVal);
      } else {
        dVal += buttons[i].val;
        l = float(dVal);
      }
    } if (buttons[i].on && buttons[i].isNum && !left && dVal.length() < 20) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        r = float(dVal);
      } else {
        dVal += buttons[i].val;
        r = float(dVal);
      }
    } else if (buttons[i].on && buttons[i].isNum && !left && dVal.length() < 20 ) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+")) {
      dVal = "0";
      opp = '+';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("-")) {
      dVal = "0";
      opp = '-';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x")) {
      dVal = "0";
      opp = 'x';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("÷")) {
      dVal = "0";
      opp = '÷';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        dVal = str(sqrt(l));
        dVal = str(PI);
        l = PI;
      } else {
        dVal = str(PI);
        r = PI;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      dVal = str(sqrt(l));
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("C")) {
      left = true;
      opp = ' ';
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0";
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("=")) {
      performCalc();
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("%")) {
        if (left) {
          l = l * 0.01;
          dVal = str(l);
        } else {
          r = r * 0.01;
          dVal = str(r);
        }
      } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("±")) {
        if (left) {
          l = l * -1;
          dVal = str(l);
        } else {
          r = r * -1;
          dVal = str(r);
        }
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("BS")) {
      if (left) {
        dVal = dVal.substring(0, dVal.length() -1);
        l = float(dVal);
      } else {
        dVal = dVal.substring(0, dVal.length() -1);
        r = float(dVal);
      }
    }
  }
}
void performCalc() {
  if (opp == '+') {
    result = l + r;
  } else if (opp == '-') {
    result = l - r;
  } else if (opp == 'x') {
    result = l * r;
  } else if (opp == '÷') {
    result = l / r;
  }
  dVal = str(result);
}

void handleEvent(String keyVal, boolean isNum) {
  // handle numbers
  if (left && dVal.length () < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length () < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  }
}

void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 104) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 51 || keyCode ==  99 ) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 52 || keyCode == 100 ) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 53 || keyCode == 101 ) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 54 || keyCode == 102 ) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 55 || keyCode == 103 ) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 56 || keyCode == 104 ) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 57 || keyCode == 105 ) {
    handleEvent("9", true);
  } else if (key == '=' || keyCode == 10) {
    handleEvent("=", true);
  } else if (key == '.' || keyCode == 110) {
    handleEvent(".", true);
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", true);
  }
}
