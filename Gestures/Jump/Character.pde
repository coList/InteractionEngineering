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
    //noStroke();
    //lights();
    translate(width/2- 100, height/2 , 0);
    sphere(30);
    translate(-(width/2- 100), -height/2 , 0);
    
    translate(width/2, height/2 , 0);
    translate(0,0,z);
    sphere(30);
    println("z: " + z);
    
  }
  
  void setY(float y) {
    this.y = y;
  }
}