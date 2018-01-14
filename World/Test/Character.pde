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

  void render() {  
    if (!duck) {
      //Körper
      pushMatrix();
      translate(this.xPos, this.yPos+50, this.zPos);
      rotateZ(PI/2);
      pushMatrix();      
      box( 200, 100, 100);      
      popMatrix();
      popMatrix();

      //Kopf      
      pushMatrix();
      translate(this.xPos, this.yPos-100, this.zPos);  
      sphere(50);      
      popMatrix();
    } else {  
      //Körper
      pushMatrix();      
      translate(this.xPos, this.yPos+100, this.zPos);
      scale(1, 0.5, 1);
      rotateZ(PI/2); 
      box( 200, 100, 100);      
      popMatrix();
      //Kopf
      pushMatrix();      
      translate(this.xPos, this.yPos+25, this.zPos);
      scale(1, 0.5, 1);
      sphere(50);     
      popMatrix();
    }
  }

  void setCoordinates(int xPos, int yPos, int zPos) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.zPos = zPos;
  }
}