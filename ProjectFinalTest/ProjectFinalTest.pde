Cone cone;
Scoop[] scoop = new Scoop[10];
PImage[] imgScoop = new PImage[6];


Trash[] trash = new Trash[5];
PImage[] imgTrash = new PImage[3];


boolean moveRight = false;
boolean moveLeft = false;

int strike = 3;

float stack = 0; 
boolean canHit = true;

PImage pinkback;
PFont curly;
int gameScreen = 0;

PFont caption;


void setup(){
  size(933,700);
  pinkback = loadImage("pinkback.png");
  
  curly = createFont("KGKissMeSlowly.ttf", 70);
  caption = loadFont("AvenirNext-Heavy.vlw");
  
  cone = new Cone(); 
  
  for (int i = 0; i < imgScoop.length; i++) {
  imgScoop[i] = loadImage("Scoop" + i + ".png"); 
  imgScoop[i].resize(0,100); }
  
  for (int i = 0; i < scoop.length; i++) {
  int index = int(random(0, imgScoop.length));
  scoop[i] = new Scoop (imgScoop[index],random(0,width),random(-300,-100)); } 
  
  for (int t = 0; t < imgTrash.length; t++) {
  imgTrash[t] = loadImage("trash" + t + ".png"); 
  imgTrash[t].resize(0,100); }
  
  for (int t = 0; t < trash.length; t++) {
  int index2 = int(random(0, imgTrash.length));
  trash[t] = new Trash (imgTrash[index2],random(0,width),random(-300,-100)); } 
  
  stack = cone.y1; 
}

void draw(){
  background(pinkback);
  
 if (gameScreen == 0){
   initScreen();
 } else if (gameScreen == 1) {
   gameScreen(); 
 } else if (gameScreen == 2) {
   gameOverScreen();
 } 


}

void hitCone() {
  for (int i=0; i<scoop.length; i++) {
    if (!scoop[i].attached && canHit && dist(scoop[i].x, scoop[i].y, cone.x1, cone.y1) < 60) {
      scoop[i].yFixed = min(scoop[i].y, stack);
      stack = scoop[i].yFixed - 25; 
      scoop[i].attached = true;
    }
  }
}

void hitTrash() {
  for (int i=0; i<trash.length; i++) {
    if (!trash[i].attached && canHit && dist(trash[i].x, trash[i].y, cone.x1, cone.y1) < 60) {
      trash[i].yFixed = min(trash[i].y, stack);
      stack = trash[i].yFixed - 15;
      strike = strike - 1; 
      trash[i].attached = true;
    }
  }
}

 void score() {
  rectMode(CORNER); 
  stroke(0); 
  strokeWeight(1);
  fill(255);
  rect(5,5,150,60,10);
  
for (int t = 0; t < trash.length; t++){
  
  float tx = 25;
  float ty = 45;
  textFont(curly);
   
  if (strike == 2 ){
  fill(255,0,0);
  textSize(25);
  text("X", tx, ty); }
  
  else if (strike == 1){
  fill(255,0,0);
  textSize(25);
  text("X", tx + 40, ty);
  text("X", tx, ty);}
  
  else if (strike == 0){
  fill(255,0,0);
  textSize(25);
  text("X", tx + 80, ty);
  text("X", tx + 40, ty);
  text("X", tx, ty); 
  gameOver();} 
  }
}



void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
    moveRight = true;
  } else if (keyCode == LEFT) {
    moveLeft = true;
  }
 }
}

void keyReleased() {
   if (key == CODED) {
    if (keyCode == RIGHT) {
    moveRight = false;
  } else if (keyCode == LEFT) {
    moveLeft = false;
  }
 }
} 

public void mousePressed() {
 
  if (gameScreen == 0) {
    startGame();
  }
  if (gameScreen == 2) {
    gameOver();
  }
    if (gameScreen == 3) {
    gameOver();
  }
}

// start the game

void startGame() {
  gameScreen = 1;
}

void gameOver(){
  gameScreen = 2;
}


void initScreen() {
  noStroke();
  fill(255,100);
  rectMode(CORNERS);
  rect(0,0,width,height);
  
  textAlign(CENTER);
  fill(255);
  textFont(curly);
  textSize(80);
  text(" Silly Scoops ", width/2,height/2);
  
  textSize(50); 
  textFont(caption,32);
  text("Catch as many scoops as you can", width/2, height-200);
  text("& avoid gross garbage", width/2, height-150);
  text("Click to start", width/2, height-50);
}

void gameScreen(){
  cone.move();
  cone.display();
  
  for (int i = 0; i < scoop.length; i++){
  scoop[i].display();  }
  
 for (int t = 0; t < trash.length; t++){
  trash[t].display();  }
  
  hitCone(); 
  hitTrash();
  score();
}

void gameOverScreen() {
  noStroke();
  fill(255,100);
  rectMode(CORNERS);
  rect(0,0,width,height);
  
  textAlign(CENTER);
  fill(255);
  textFont(curly);
  textSize(70);
  text("Game Over", width/2,height/2);
}
