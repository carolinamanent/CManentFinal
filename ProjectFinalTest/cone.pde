class Cone {
  
  PImage cone;
  float x1;
  float y1;
  String move;
  float speed = 10;
  
  Cone() {
    x1 = width/2;
    y1 = height-100;
  }
  
  void display(){
    cone = loadImage("cone.png");
    cone.resize(0,100);
    image(cone,x1,y1);
  }
    
  void move(){
    if (moveRight && x1 < width-50) {
      x1 += speed;
    }
    if (moveLeft && x1 > 0){
      x1 -= speed;
    }
  }
  

}
