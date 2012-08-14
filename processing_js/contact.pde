int dia = 72;
int dia2 = 72;
int a = 225;

float x1, x2, x3, x4, x5, x6;
float y1, y2, y3, y4, y5, y6;

boolean[] testers = new boolean[9];


boolean true1, true2, true3, true4, true5, true6, true7, true8, true9;

int count = 0;
float angle = 0;


void setup() 
{
  size(352, 304);
  smooth();

  for(int i=0; i<8; i++) {
    testers[i] = false;
  }
}



void draw() 
{
  background(255);  

  translate(0.28222222*a, 0.242487298*a); //0.577350269*a


    if(mouseX>25 && mouseX < 325 && mouseY > 25 && mouseY < 275) {
      move();  
  }
  else {
    dflt();
  }
  display();
}


void display() {  
  stroke(0);
  strokeWeight(15);
  line(x1, y1, x2, y2);
  line(x1, y1, x4, y4);
  line(x2, y2, x4, y4);
  line(x2, y2, x5, y5);
  line(x3, y3, x2, y2);
  line(x3, y3, x5, y5);
  line(x4, y4, x5, y5);
  line(x4, y4, x6, y6);
  line(x5, y5, x6, y6);


  fill(0);
  noStroke();
  ellipse(x1, y1, dia2, dia2);
  ellipse(x2, y2, dia2, dia2);
  ellipse(x3, y3, dia2, dia2);
  ellipse(x4, y4, dia2, dia2);
  ellipse(x5, y5, dia2, dia2);
  ellipse(x6, y6, dia2, dia2);
}

void dflt() {  
  
  count = 0;
  dia2 = 72;

  x1 = 0;
  y1 = 0.866025404*a;

  x2 = a/2;
  y2 = 0.866025404*a;

  x3 = a;
  y3 = 0.866025404*a;

  x4 = a/4;
  y4 = 0.433012702*a;

  x5 = 0.75*a;
  y5 = 0.433012702*a;

  x6 = a/2;
  y6 = 0;
}


void move() {

  float testX1 = a/2 - dia;
  if(x1 < testX1) {
    x1 = x1 + 0.9;
    testers[0] = true;
  }

  float testY1 = 0.433012702*a + 0.866025404*dia;
  if(y1 > testY1) {
    y1 = y1 - 0.8;
    testers[1] = true;
  }

  float test2 = 0.433012702*a + 0.866025404*dia;
  if(y2 > test2) {
    y2 = y2 - 0.8;
    testers[2] = true;
  }

  float testX3 = a/2 + dia;
  if(x3 > testX3) {
    x3 = x3 - 0.9;
    testers[3] = true;
  }

  float testY3 = 0.433012702*a + 0.866025404*dia;
  if(y3 > testY3) {
    y3 = y3 - 0.8;
    testers[8] = true;
  }

  float test4 = 0.5*a - dia/2;   
  if(x4 < test4) {
    x4 = x4 + 0.5;
    testers[4] = true;
  }

  float test5 = 0.5*a + dia/2;   
  if(x5 > test5) {
    x5 = x5 - 0.5;
    testers[5] = true;
  }

  float test6 = 0.433012702*a - 0.866025404*dia;
  if(y6 < test6) {
    y6 = y6 + 0.8;
    testers[6] = true;
  }

  if( testers[0]&&testers[6]){ count++;
 if(count>50){dia2 = dia2 + 1.5*sin( angle ); angle = angle + 0.05;}
}

}





