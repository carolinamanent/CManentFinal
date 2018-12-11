class Scoop {
  
  float x;
  float y;
  
  boolean attached = false; 
  
  float yFixed; 
  float yspeed = random(0.5,2);

  int s;

  PImage imgScoop;
  
  Scoop (PImage tempImg, float tempX, float tempY) {
    
    x = tempX;
    y = tempY;
    imgScoop = tempImg;
    s = 5;
   
  }  
  
  void display() {
   
    if (attached) {
      image(imgScoop, (cone.x1 - 45), yFixed);
       }  
      
    else if (y > height){
      y = random(-200,-100);
      x = random (0, width-50); }  
    
    else {
      image(imgScoop,x,y);
       y = y + yspeed;
    }
  }

  
}
 
