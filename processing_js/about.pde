/* @pjs preload="processing_js/drop.png"; */

PImage one;
PImage logo;

int numBalls = 50;
float spring = 0.05;
float gravity = 0.02;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];
float angle = 0;

void setup() 
{
  size(350, 304);
  noStroke();
  smooth();

  one  = loadImage("processing_js/rainDrop.png");
  logo = loadImage("processing_js/winkerVSbecksLogo.jpg");


  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(25, 325), random(-200, 0), random(40,50), i, balls);
  }

  imageMode(CENTER);
}

float butX = 200;

void draw() 
{
  background(255);

  image(logo, width/2, height/2);

  if(mouseX>25 && mouseX < 325 && mouseY > 25 && mouseY < 275) {


    for (int i = 0; i < numBalls; i++) {
      balls[i].collide();
      balls[i].move();
      balls[i].display();
    }
  }
}

class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
  float yDef;
  int counter;

  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    yDef = yin;
    diameter = din;
    if(idin>5) {
      id = (int)(random(5));
    }
    else {
      id = idin;
    }
    others = oin;
  } 

  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }
  }

  void move() {
    vy += gravity;
    //x += vx;
    y += vy;
    //    if (x + diameter/2 > width) {
    //      x = width - diameter/2;
    //      vx *= friction;
    //    }
    //    else if (x - diameter/2 < 0) {
    //      x = diameter/2;
    //      vx *= friction;
    //    }
    if (y + diameter/2 > 500) {
      y = random(-200,0);
      vy *= friction;
    } 
    //    else if (y - diameter/2 < 0) {
    //      y = diameter/2;
    //      vy *= friction;
    //    }
  }

  void display() {
    image(one, x,y);
  }
}

