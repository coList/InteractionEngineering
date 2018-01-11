class Character {
  float x;
  float y;
  float z;
  PVector speed;
  int size;
  
  boolean isWalking = false;
  
  Character(float x, float y, float z, int size) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.size = size;
  }
  
  void render() {
    translate(width/2- 100, height/2 , 0);
    sphere(30);
    translate(-(width/2- 100), -height/2 , 0);
    
    translate(x,y,z);
    sphere(30);
    println("z: " + z);
    translate(-x, -y, -z);
    translate(-width/2, -height/2, 0);
  }
  
  void move() {
     if (isWalking) {
       x += speed.x;
       y += speed.y;
     }
  }
  
  
  void setX(float x) {
    this.x = x;
  }
  
    
  void setY(float y) {
    this.y = y;
  }
  
  void setSpeed(PVector speed) {
    this.speed = speed;
  }
}