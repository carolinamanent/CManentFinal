class Trash {
  
  float x;
  float y;
  PImage imgTrash;  
  boolean attached = false;   
  float yFixed; 
  float yspeed = random(0.5,2);
  
   Trash (PImage tempImg, float tempX, float tempY) { // scoop constructor with data set in the main code
    
    x = tempX;
    y = tempY;
    imgTrash = tempImg;
   
  }    
  
  void display() {
 
    if (attached) { // when the boolean is true, the following happens to the trash
      image(imgTrash,cone.x1-10, yFixed); }  
      
    else if (y > height){ // if it passes the height, it resets to above 0 
      y = random(-200,-100);
      x = random (0, width-50); }  
    
    else { // otherwise, just come falling down  the screen
      image(imgTrash, x, y);
       y = y + yspeed;
    }
  }
  
} 
  
  
