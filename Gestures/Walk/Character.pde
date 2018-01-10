class Character {
  float x;
  float y;
  PVector speed;
  int size;
  
  boolean isWalking = false;
  
  Character(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    
    speed = new PVector(0,-2);
  }
  
  void render() {
    fill(0);
    ellipse(x, y, size, size);
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
  
  void setSpeed(PVector speed) {
    this.speed = speed;
  }
  
  void setIsWalking(boolean isWalking) {
    println(isWalking);
    this.isWalking = isWalking;
  }
}