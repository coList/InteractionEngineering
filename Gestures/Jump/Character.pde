class Character {
  float x;
  float y;
  float z;
  int size;
  
  Character(float x, float y, float z, int size) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.size = size;
  }
  
  void render() {
    fill(0);
    ellipse(x, y, size, size);
    translate(0,0,z);
  }
  
  void setY(float y) {
    this.y = y;
  }
}