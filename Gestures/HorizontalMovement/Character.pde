class Character {
  float x;
  float y;
  int size;
  
  Character(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void render() {
    fill(0);
    ellipse(x, y, size, size);
  }
  
  void setX(float x) {
    this.x = x;
  }
}