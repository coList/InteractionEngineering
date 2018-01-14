class Character {  

  boolean duck = false;
  int xPos;
  int yPos;
  int zPos;
  float zVelocity;


  Character(int xPos, int yPos, int zPos) {  
    this.xPos=xPos;
    this.yPos= yPos;
    this.zPos= zPos;
  }

  void initialize() {
    pushMatrix();
    translate(this.xPos, this.yPos, this.zPos);
    rotateZ(PI/2);
    box( 300, 100, 100);
    popMatrix();
  }

  void render() {  
    if (!duck) {
      pushMatrix();
      translate(this.xPos, this.yPos, this.zPos);
      rotateZ(PI/2);
      box( 300, 100, 100);
      popMatrix();
    } else {    
      pushMatrix();      
      translate(this.xPos, this.yPos+75, this.zPos);
      scale(1, 0.5, 1);
      rotateZ(PI/2);       
      box( 300, 100, 100);      
      popMatrix();
    }
  }

  void setCoordinates(int xPos, int yPos, int zPos) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.zPos = zPos;
  }
}