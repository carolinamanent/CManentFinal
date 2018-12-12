class Scoop {
  
  float x;
  float y; 
  boolean attached = false;  // sets attached to false so it can be altered later   
  float yFixed; 
  float yspeed = random(0.5,2); // random rates for scoops coming down 
  PImage imgScoop;
  
  Scoop (PImage tempImg, float tempX, float tempY) { // scoop constructor with data set in the main code
    
    x = tempX;
    y = tempY;
    imgScoop = tempImg;
   
  }  
  
  void display() {
   
    if (attached) { // when the boolean is true, the following happens to the scoop
      image(imgScoop, (cone.x1 - 45), yFixed);
       }  
      
    else if (y > height){ // if it passes the height, it resets to above 0 
      y = random(-200,-100);
      x = random (0, width-50); }  
    
    else { // otherwise, just come falling down  the screen 
      image(imgScoop,x,y);
       y = y + yspeed;
    }
  }

  
}
 
