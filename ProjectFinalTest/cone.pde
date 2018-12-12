class Cone {
  
  PImage cone; // new image being made
  float x1; 
  float y1;
  String move;
  float speed = 10; // speed at which arrow keys move
  
  Cone() { // cone constructor ! not much changing data 
    x1 = width/2; // location of cone
    y1 = height-100;
  }
  
  void display(){ // loads and resizes the image and sets the x and y 
    cone = loadImage("cone.png");
    cone.resize(0,100);
    image(cone,x1,y1);
  }
    
  void move(){ // functon to move the arrow keys as long as their within the set range
    if (moveRight && x1 < width-50) {
      x1 += speed;
    }
    if (moveLeft && x1 > 0){
      x1 -= speed;
    }
  }
  

}
