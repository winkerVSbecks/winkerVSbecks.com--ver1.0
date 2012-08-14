/* @pjs preload="processing_js/drop.png"; */

PImage one;

PFont myFont;

int numBalls = 12;
float spring = 0.05;
float gravity = -0.03;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];
float angle = 0;

void setup() 
{
  size(600, 600);
  noStroke();
  smooth();
  
  frameRate(40);

  cursor(HAND);

  myFont = createFont("HelveticaNeue Light ", 16);
  textFont(myFont);

  one  = loadImage("processing_js/drop.png");


  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(320,480), random(300, 500), 50, i, balls);
  }

  imageMode(CENTER);
}

float butX = 200;

void draw() 
{
  background(255);
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();
  }

  stroke(0);
  strokeWeight(2);
  strokeCap(ROUND); 
  line(200,550,400,550);
  noStroke();
  

  if(mouseX <= 575 && mouseX >= 25){
      fill(253,79,89);
}else{fill(0);}

  ellipse(butX,550,20,20);
  
  fill(0);
  textAlign(CENTER);
  text("GRAVITY", width/2,580);

  if(mousePressed && mouseX <= 400 && mouseX >= 200){
      butX = mouseX;
      gravity = map(butX,200,400,-0.03, 1)
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
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction;
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > 500) {
      y = 500 - diameter/2;
      vy *= friction;
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }

  void display() {
    image(one, x,y);
  }

}

