PImage[] images = new PImage[5];
PFont myFont;

boolean initiated = false;
boolean initiated2 = false;
boolean initiated3 = false;
boolean initiated4 = false;
boolean initiated5 = false;
boolean initiated6 = false;
boolean initiated7 = false;
boolean initiated8 = false;

float dia1 =  86.185;
float dia2 =  476;
float del = 1;


void setup() 
{
  size(600, 600);
  noStroke();
  smooth();
  frameRate(40);

  myFont = createFont("HelveticaNeue", 64);
  textFont(myFont);

  images[0]  = loadImage("processing_js/c1.png");
  images[1]  = loadImage("processing_js/2.png"); 
  images[2]  = loadImage("processing_js/3.png");
  images[3]  = loadImage("processing_js/4.png"); 
  images[4]  = loadImage("processing_js/5.png");

  imageMode(CENTER);
}

void draw() 
{
  background(255);

  if(!initiated) {
    initiate();
  }

  if(initiated && !initiated2) {
    transition();
  }

  if(initiated2 && !initiated3) {
    transition2();
  }

  if(initiated3 && !initiated4) {
    transition3();
  }

  if(initiated4 && !initiated5) {
    transition4();
  }

  if(initiated5 && !initiated8) {
    blades();
  }

  if(initiated8){
    displayFinal();
  }
  //displayFinal();
}

void initiate() {

  float dt = dist(width/2, height/2, mouseX, mouseY);

  if(dt<97) {    
    fill(253,79,89);
    stroke(253,79,89);

    cursor(HAND);

    if(mousePressed) {
      fill(0);
      stroke(0);
      initiated = true;
    }
  }
  else {
    fill(0);
    stroke(0);
  }

  strokeWeight(10);
  ellipse(width/2, height/2, dia1,dia1);
}


void transition() {
  dia1 = dia1 - 1;
  if(dia1 < 0.2) {
    initiated2 = true;
  }

  fill(0);
  stroke(0);
  ellipse(width/2, height/2, dia1,dia1);
} 

void transition2() {

  if(dia1<86) { 
    dia1 = dia1 + 1;
  }
  else {
    initiated3 = true; 
    dia2 = 0;
  }
  fill(255);
  stroke(0);
  strokeWeight(10);
  ellipse(width/2, height/2, dia1,dia1);
}

void transition3() {

  fill(255);
  stroke(0);

  if(dia2<475) {
    dia2 = dia2 + 50/del; 
    del = del + 0.35;
  }
  else {
    initiated4 = initiated5 = true;
  }
  strokeWeight(30);
  ellipse(width/2, height/2, dia2,dia2);

  strokeWeight(10);
  ellipse(width/2, height/2, dia1,dia1);
}


void transition4() {

  delay(1000);


  fill(255);
  stroke(0);

  strokeWeight(30);
  ellipse(width/2, height/2, dia2,dia2);

  strokeWeight(10);
  ellipse(width/2, height/2, dia1,dia1);

  pushMatrix();
  translate(width/2, height/2);
  image(images[0], 0, 0);
  popMatrix();

  initiated5 = true;
}


float x1, x2, x3;
float y1, y2, y3;
float r = 0;
float dia3 = 122.745;
float del2 = 1;
int counter = 0;


void blades() {

  fill(255);
  stroke(0);

  strokeWeight(30);
  ellipse(width/2, height/2, dia2,dia2);

  strokeWeight(10);
  ellipse(width/2, height/2, dia1,dia1);

  pushMatrix();
  translate(width/2, height/2);
  image(images[0], 0, 0);
  popMatrix();

  x1 = width/2;
  y1 = height/2 - r;


  x2 = width/2  + r*(-0.866025404);
  y2 = height/2 + r*0.5;

  x3 = width/2  + r*0.866025404;
  y3 = height/2 + r*0.5;

  if(r<150) {
    r = r +  5; 
    del2 = del2 + 0.5;
  }
  else {
    initiated6 = true;
  }


  if(initiated7) {
    counter++;

    if(counter%2 == 0) {
      stroke(0); 
      fill(0);
    }
    else {
      stroke(255); 
      fill(255);
    }

    if(counter == 150) {
      initiated8 = true;
    }
  }
  else {
    stroke(0); 
    fill(0);
  }

  strokeWeight(30);
  line(width/2, height/2, x1, y1);
  line(width/2, height/2, x2, y2);
  line(width/2, height/2, x3, y3);

  if(initiated6) {
    noStroke();
    ellipse(x1,y1, dia3, dia3);
    ellipse(x2,y2, dia3, dia3);
    ellipse(x3,y3, dia3, dia3);
    initiated7 = true;
  }
}

float angle = 0;
float acc = 1.1;
float speed = 0.0001;
float speedLimit = 0.25;


void displayFinal() {

  frameRate(25);
  pushMatrix();
  translate(width/2, height/2);

  noFill();
  stroke(0);
  strokeWeight(10);
  ellipse(0,0, dia1,dia1);
  strokeWeight(30);
  ellipse(0,0, dia2,dia2);
  noStroke();
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(images[0], 0, 0);
  image(images[4], 0, -39);
  popMatrix();
  
  speed = speed*acc;
  
  if(speed>speedLimit){speed = speedLimit;}

  angle = angle + speed;
  
}

