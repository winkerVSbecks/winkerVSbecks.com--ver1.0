/* @pjs preload="processing_js/1.png"; */

PImage one;


int numBalls = 12;
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

  one  = loadImage("processing_js/1.png");


  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(320,480), random(300, 500), random(20, 40), i, balls);
  }

  imageMode(CENTER);
  
  cursor(HAND);
}

void draw() 
{
  background(255);
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();
  }
   
  fill(0);
 
  //ellipse(width/2, height/2, 200,200); 
  
  image(one, width/2, 400);
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
    float dAcY = abs(mouseY - height/2);

    if(y<100){
   	  fill(counter);
      ellipse(x,y, diameter, diameter);
      counter = counter + 20;
     }else{

    if(dAcX < 80 && dAcY < 400) {    
      fill(0);

      ellipse(x,y, diameter, diameter);
      
      counter = 0;
    }
    else {
      fill(counter);
      ellipse(x,y, diameter, diameter);
      counter = counter + 10;
    }
   }
  }
}

