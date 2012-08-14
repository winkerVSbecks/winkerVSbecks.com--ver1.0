/* @pjs preload="processing_js/1.png"; */

PImage fish;
PImage knife;


int numBalls = 50;
float spring = 0.05;
float gravity = -0.01;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];

void setup() 
{
  size(600, 600);
  noStroke();
  smooth();

  frameRate(40);

  fish  = loadImage("processing_js/fish.png");
  knife = loadImage("processing_js/knife.png");

  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(200,350), random(490, 450), random(20, 40), i, balls);
  }

  imageMode(CENTER);

  cursor(HAND);
}

void draw() 
{
  background(255);

  image(fish, width/2, 500);

  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();
  }

  image(knife, mouseX, mouseY);
}

class Ball {
  float x, y;
  float diameter;
  float vx = random(5);
  float vy = 0;
  int id;
  Ball[] others;
  float yDef;
  int counter = 255;

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
    if (x + diameter/2 > 380) {
      x = 380 - diameter/2;
      vx *= friction;
    }
    else if (x - diameter/2 < 220) {
      x = 220 + diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > 500) {
      y = 500 - diameter/2;
      vy *= friction;
    } 
    else if (y - diameter/2 < -50) {
      y = yDef;
      vy *= friction;
    }
  }

  void display() {

    float dAcX = abs(mouseX - width/2);
    float dAcY = abs(mouseY - 500);

    if(y<100) {
      fill(253, 79, 89, counter);
      ellipse(x,y, diameter, diameter);
      counter = counter - 40;
      if(counter<0){counter = 0;}
    }
    else {

      if(dAcX < 80 && dAcY < 100) {    
        
        stroke(253, 79, 89);
        strokeWeight(10);
        strokeCap(ROUND);
        line(200,501,400,500);
        line(200,501,400,501);
        line(200,502,400,502);
        line(200,503,400,503);
        line(200,504,400,504);
        noStroke();
        
        fill(253, 79, 89);
        ellipse(x,y, diameter, diameter);

        counter = 255;
      }
      else {
        fill(253, 79, 89, counter);
        ellipse(x,y, diameter, diameter);
        counter = counter - 10;
        if(counter<0){counter = 0;}
      }
    }
  }
}

