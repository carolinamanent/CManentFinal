class Scoop {
  
  float x;
  float y;
  
  boolean checkHit;
  boolean attached=false; 
  float yFixed; 
  float yspeed = random(0.5,2);

  int s;

  PImage img;
  
  Scoop (String file) {
    for (int i=0; i<scoop.length; i++) { 
    img = loadImage("scoop" + i + ".png"); 
    img.resize(0,50); }
 
    x = (random(0, width));
    y =  random(-200, -100); 
    s = 5;
   
  }  
  
  void display() {
 
    if (attached) {
      // sitting on cone
      image(img,cone.x1, yFixed, 50, 50);
      img.resize(0,50); }  
      
    else if (y > height){
      y = random(-200,-100);
      x = random (0, width-50); }  
    
    else {
      image(img, x, y);
      img.resize(0,50);
       y = y + yspeed;
    }
  }
  
}
 
