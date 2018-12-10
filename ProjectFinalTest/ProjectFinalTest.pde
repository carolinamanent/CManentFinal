Cone cone;
Scoop[] scoop = new Scoop[2];
Trash[] trash = new Trash[2];

boolean moveRight = false;
boolean moveLeft = false;
int score;
float stack = 0; 
boolean canHit = true;
boolean onCone = false;
int strike = 0;


void setup(){
  fullScreen();
  cone = new Cone();

  for (int i = 0; i < scoop.length; i++) {
  int index = int(random(0, scoop.length));
  scoop[i] = new Scoop ("scoop" + index + ".png"); }
  
  for (int t = 0; t < trash.length; t++) {
  int index = int(random(0, trash.length));
  trash[t] = new Trash ("trash" + index + ".png"); }
  
  stack = cone.y1; 
}

void draw(){
  background(255);
  
  cone.move();
  cone.display();
  
  for (int i = 0; i < scoop.length; i++){
  scoop[i].display(); }
  
 for (int t = 0; t < scoop.length; t++){
  trash[t].display(); }
  
  hitCone(); 
  trashCone();
  score();

}

void hitCone() {
  for (int i=0; i<scoop.length; i++) {
    // HIT? 
    if (!scoop[i].attached && canHit && dist(scoop[i].x, scoop[i].y, cone.x1, cone.y1) < 50) {
      scoop[i].yFixed = min(scoop[i].y, stack);
      stack = scoop[i].yFixed - 10; 
      scoop[i].attached=true;
    }
  }
}

void trashCone() {
  for (int t=0; t<trash.length; t++) {
    // HIT? 
    if (!trash[t].attached && canHit && dist(trash[t].x, trash[t].y, cone.x1, cone.y1) < 30) {
      trash[t].yFixed = min(trash[t].y, stack);
      stack = trash[t].yFixed - 10; 
      strike = strike + 1;
      trash[t].attached=true;
    }      

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

void score() {
  //rectMode(CORNER); 
  //stroke(0); 
  //strokeWeight(1);
  //fill(255);
  //rect(5,5,200,60,10);
  float tx = 20;
  float ty = 35;
  
  for (int t=0; t<trash.length; t++) {
    
  if (trash[t].attached == true && strike == 1 ){
  fill(255,0,0);
  textSize(25);
  text("X", tx, ty); }
  
  if (trash[t].attached == true && strike == 2){
  fill(255,0,0);
  textSize(25);
  text("X", tx + 10, ty); }
  
  if (trash[t].attached == true && strike == 3){
  fill(255,0,0);
  textSize(25);
  text("X", tx + 20, ty);  } 
  }
}
 
