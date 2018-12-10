class Trash {
  
  float x;
  float y;
  
  boolean checkHit;
  boolean attached=false; 
  float yFixed; 
  float yspeed = random(0.5,2);

  int s;
  int l;


  PImage imgTrash;
  
  Trash (String file) {
    for (int t=0; t<trash.length; t++) { 
    imgTrash = loadImage("trash" + t + ".png"); 
    imgTrash.resize(0,50); }
 
    x = (random(0, width));
    y =  random(-200, -100); 
    s = 5;
    l = 0;
   
  }  
  
  void display() {
 
    if (attached) {
      // sitting on cone
      image(imgTrash,cone.x1, yFixed, 50, 50);
      imgTrash.resize(0,50);  }  
      
    else if (y > height){
      y = random(-200,-100);
      x = random (0, width-50); }  
    
    else {
      image(imgTrash, x, y);
      imgTrash.resize(0,50);
       y = y + yspeed;
    }
  }
  
    void spawn() {
    for (int i = 0; i< l; i++)
    { 
      y = random(-3700, -111); 
      x = int(random(50, 350));
      canHit = true;
    }

  }
  
}
