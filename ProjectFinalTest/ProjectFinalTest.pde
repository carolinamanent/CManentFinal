/* Silly Scoops
Creative Coding Fall 2018 - Final Project 
Carolina Manent  */

Cone cone; // Calls the class and sets the variables name to be used here
Scoop[] scoop = new Scoop[10]; // Calls the class, sets variable name, and number to appear on screen 
PImage[] imgScoop = new PImage[6]; // New array of images and the amount there are 


Trash[] trash = new Trash[5]; // Calls the class, sets variable name, and number to appear on screen 
PImage[] imgTrash = new PImage[3]; // New array of images and the amount there are


boolean moveRight = false; // booleans used to control left and right key movements
boolean moveLeft = false;

int strike = 3; // sets the strikes to three and later counts down from there
int count = 0; // sets count to zero to increase by one everytime a scoop is hit

float stack = cone.y1; // sets stack value to cone's y 
boolean scoopHit = true; // boolean to control stacking of scoops

PImage pinkback; // creates the class for the pink brick image as background
PFont curly; // creates class for imported font 

int gameScreen = 0; // sets gamescreen to zero, will later count up depending on mouse clicks

PFont caption; // creates class for a second font 

import processing.sound.*; // imports processings sound functions
SoundFile file; // creates a name "file" for the sound file to be called later



//////// SETUP FUNCTION /////////

void setup(){
  size(933,700); // size of the screen is set to the same as the background image
  pinkback = loadImage("pinkback.png"); // loads the data and creates the background image 
   
  file = new SoundFile(this, "funsound.mp3"); //calls and loads the data 
  file.play(); // plays the song 
  
  curly = createFont("KGKissMeSlowly.ttf", 70); // calls and loads the data for font
  caption = loadFont("AvenirNext-Heavy.vlw"); // calls and loads data for second font
  
  cone = new Cone();  // calls the cone class and creates a new cone 
  
  for (int i = 0; i < imgScoop.length; i++) { // calls the array of images
  imgScoop[i] = loadImage("Scoop" + i + ".png"); // images are all named Scoop#, this calls them easily in one line instead of calling them individually
  imgScoop[i].resize(0,100); } // resizes the image to fit nicer on the screen 
  
  for (int i = 0; i < scoop.length; i++) { // calls the array 
  int index = int(random(0, imgScoop.length)); // program picks random image from the array
  scoop[i] = new Scoop (imgScoop[index],random(0,width),random(-300,-100)); } // assigns data to class constructor 
  
  for (int t = 0; t < imgTrash.length; t++) { // calls the array of images
  imgTrash[t] = loadImage("trash" + t + ".png"); // images are all named trash#, this calls them easily in one line instead of calling them individually
  imgTrash[t].resize(0,100); } // resizes the image to fit nicer on the screen 
  
  for (int t = 0; t < trash.length; t++) { // calls the array
  int index2 = int(random(0, imgTrash.length)); // program picks random image from the array
  trash[t] = new Trash (imgTrash[index2],random(0,width),random(-300,-100)); } // assigns data to class constructo
    
}


//////// DRAW FUNCTION /////////

void draw(){
  background(pinkback); // sets background to the image 
  
 if (gameScreen == 0){ // always begins at initial screen bc gameScreen is set to zero at start
   initScreen();
 } else if (gameScreen == 1) { // when game screen is 1, starts the game 
   gameplayScreen();
 } else if (gameScreen == 2) { //when game screen is 2, game over screen pops up 
   gameOverScreen();
 } 
 //else if (gameScreen == 3) {
 //  reset();
 //} 
}

//////// ATTEMPT AT A RESET BUTTON ///////

//void reset(){  
//Cone cone;
//Scoop[] scoop = new Scoop[10];
//PImage[] imgScoop = new PImage[6];
//Trash[] trash = new Trash[5];
//PImage[] imgTrash = new PImage[3];
//boolean moveRight = false;
//boolean moveLeft = false;
//int strike = 3;
//int count = 0;
//float stack = 0; 
//boolean canHit = true;
//int gameScreen = 0;
//setup();
//}


//////// SCOOP HITS CONE FUNCTION /////////

void hitCone() {
  for (int i=0; i<scoop.length; i++) { // calls array of scoops
    if (!scoop[i].attached && scoopHit && dist(scoop[i].x, scoop[i].y, cone.x1, cone.y1) < 60) { // parameters for scoop to be caught
      scoop[i].yFixed = min(scoop[i].y, stack); // makes the scoops new equal to the minimum between the new scoops y or the stack (cone's y)
      stack = scoop[i].yFixed - 50; // stack updates to be minus 50 every time 
      count = count + 1; // count increases to update score
      scoop[i].attached = true; // boolean set to true 
    }
  }
}

//////// TRASH HITS CONE FUNCTION /////////

void hitTrash() {
  for (int i=0; i<trash.length; i++) {
    if (!trash[i].attached && scoopHit && dist(trash[i].x, trash[i].y, cone.x1, cone.y1) < 60) { // parameters for scoop to be caught
      trash[i].yFixed = min(trash[i].y, stack); // makes the trash new equal to the minimum between the new trash y or the stack (cone's y)
      stack = trash[i].yFixed - 10; // stack updates to be minus 10
      strike = strike - 1;  // strike starts at three but subtracts by one everytime a trash is caught
      trash[i].attached = true; // boolean set to true
    }
  }
}

//////// THREE STRIKES FUNCTION /////////

 void strikesScore() { //
  rectMode(CORNER);  // rectangle in the top left to highlight srikes
  stroke(0); 
  strokeWeight(1);
  fill(255);
  rect(5,5,150,60,10);
  
for (int t = 0; t < trash.length; t++){ // calls trash array 
  
  float tx = 25; // variables set to specific numbers 
  float ty = 45;
  textFont(curly); // calling the curly font 
   
  if (strike == 2 ){ // following if statements set requirements for strikes to occur on screen 
  fill(255,0,0);
  textSize(25);
  text("X", tx, ty); }
  
  else if (strike == 1){
  fill(255,0,0);
  textSize(25);
  text("X", tx + 40, ty); // distance of x changed for aesthetics 
  text("X", tx, ty);}
  
  else if (strike == 0){
  fill(255,0,0);
  textSize(25);
  text("X", tx + 80, ty);
  text("X", tx + 40, ty);
  text("X", tx, ty); 
  gameOver();}  // once the final strike is reached, game over function is called
  }
}


//////// SCOOP SCORE FUNCTION /////////

void countScore(){
    for (int i=0; i<scoop.length; i++) {
      fill(255);
      textFont(caption,25);
      text("Score: " + count, width-70,50);      
    }
 }


//////// USING THE ARROW KEYS FUNCTION /////////

void keyPressed() { // when the key is pressed the booleans are true making the cone move
  if (key == CODED) {
    if (keyCode == RIGHT) {
    moveRight = true;
  } else if (keyCode == LEFT) {
    moveLeft = true;
  }
 }
}

void keyReleased() { // when the key is let go the booleans are false aka not used
   if (key == CODED) {
    if (keyCode == RIGHT) {
    moveRight = false;
  } else if (keyCode == LEFT) {
    moveLeft = false;
  }
 }
} 

//////// MOUSE CLICKS FUNCTION /////////

public void mousePressed() {
  gameScreen++; // gameScreen is added whenever called
  
  if (gameScreen == 0) { // when the mouse is pressed go from 0 to startgame() which is one
    startGame();
  }
  if (gameScreen == 2) { // with the screen at one, when the player loses the screen goes to two which sends them to the gameover screen
    gameOver(); // gameover is screen 
  }
}

//////// GAME SCREEN SETTING FUNCTION /////////

void startGame() { // start game function makes gameScreen 1 which changes the screen to gamePlay screen 
  gameScreen = 1;
}

void gameOver(){ // gameover function makes gameScreen two which changes the screen to gameOverScreen
  gameScreen = 2;
}

//////// INITIAL SCREEN FUNCTION /////////

void initScreen() {
  noStroke();  // transparent layer for asthetic value 
  fill(255,100);
  rectMode(CORNERS);
  rect(0,0,width,height);
  
  textAlign(CENTER); // title!
  fill(255);
  textFont(curly);
  textSize(80);
  text(" Silly Scoops ", width/2,height/2);
  
  textSize(50);  // instructions
  textFont(caption,32);
  text("Use arrow keys to catch as many scoops as you can", width/2, height-200);
  text("& avoid gross garbage", width/2, height-150);
  text("Click to start", width/2, height-50);
}

//////// GAME SCREEN FUNCTION /////////

void gameplayScreen(){ // where all the magic happens
  cone.move(); // calls functions from cone class 
  cone.display();
  
  for (int i = 0; i < scoop.length; i++){ // calls functions from scoop class & array
  scoop[i].display();  }
  
 for (int t = 0; t < trash.length; t++){ // calls functions from trash class & array
  trash[t].display();  }
  
  hitCone();  // calls above functions 
  hitTrash();
  strikesScore();
  countScore();
}

//////// GAME OVER SCREEN FUNCTION /////////

void gameOverScreen() { // three strikes you're out!
  noStroke(); // asthetic value 
  fill(255,100);
  rectMode(CORNERS);
  rect(0,0,width,height);
  
  textAlign(CENTER); // game over text and final score
  fill(255);
  textFont(curly);
  textSize(70);
  text("Game Over", width/2,height/2);
  textSize(50);
  text("Score: " + count, width/2,height/2+100);

}
