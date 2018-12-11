class Trash {
  
  float x;
  float y;
  PImage imgTrash;
  
  boolean checkHit;
  boolean attached=false; 
  float yFixed; 
  float yspeed = random(0.5,2);

  int s;
  
   Trash (PImage tempImg, float tempX, float tempY) {
    
    x = tempX;
    y = tempY;
    imgTrash = tempImg;
    s = 5;
   
  }    
  
  void display() {
 
    if (attached) {
      // sitting on cone
      image(imgTrash,cone.x1, yFixed); }  
      
    else if (y > height){
      y = random(-200,-100);
      x = random (0, width-50); }  
    
    else {
      image(imgTrash, x, y);
      imgTrash.resize(0,50);
       y = y + yspeed;
    }
  }
  

  
  
} 
  
  
