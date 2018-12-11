Cone cone;
Scoop[] scoop = new Scoop[10];
PImage[] imgScoop = new PImage[6];


Trash[] trash = new Trash[4];
PImage[] imgTrash = new PImage[2];


boolean moveRight = false;
boolean moveLeft = false;

int strike = 3;

float stack = 0; 
boolean canHit = true;


void setup(){
  fullScreen();
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
  background(0);
  
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
      stack = trash[i].yFixed - 25;
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
  rect(5,5,200,60,10);
  
for (int t = 0; t < trash.length; t++){
  
  float tx = 20;
  float ty = 45;
      
  if (strike == 2 ){
  fill(255,0,0);
  textSize(25);
  text("X", tx, ty); }
  
  else if (strike == 1){
  fill(255,0,0);
  textSize(25);
  text("X", tx + 30, ty);
  text("X", tx, ty);}
  
  else if (strike == 0){
  fill(255,0,0);
  textSize(25);
  text("X", tx + 60, ty);
  text("X", tx + 30, ty);
  text("X", tx, ty);} 
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


 
