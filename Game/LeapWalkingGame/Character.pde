class Character {  

  PVector position;
  boolean duck = false;
  boolean jump = true;
  PVector speed;
  int collisionsCount = 5;
  boolean isWalking = false;


  Character(int xPos, int yPos, int zPos) {  
    position = new PVector(xPos, yPos, zPos);
    speed = new PVector(5, 5, 5);
  }

  void render() {  
    if (!duck) {
      if (jump) {
        pushMatrix();
        translate(0, -200, 0);
      }
      //Körper
      pushMatrix();
      translate(position.x, position.y+50, position.z);
      rotateZ(PI/2);
      pushMatrix();      
      box( 200, 100, 100);      
      popMatrix();
      popMatrix();

      //Kopf      
      pushMatrix();
      translate(position.x, position.y-100, position.z);  
      sphere(50);      
      popMatrix();

      if (jump) {
        popMatrix();
      }
    } else {  
      //Körper
      pushMatrix();      
      translate(position.x, position.y+100, position.z);
      scale(1, 0.5, 1);
      rotateZ(PI/2); 
      box( 200, 100, 100);      
      popMatrix();
      //Kopf
      pushMatrix();      
      translate(position.x, position.y+25, position.z);
      scale(1, 0.5, 1);
      sphere(50);     
      popMatrix();
    }
  }
  
  void move() {
    if (isWalking) {
      position.x += speed.x;
      position.z += speed.z;
    }
  }
  void setIsWalking(boolean isWalking) {
    this.isWalking = isWalking;
  }

  void setSpeed(PVector speed) {
    this.speed = speed;
  }

  void setCoordinates(float xPos, float yPos, float zPos) {
    position.set(xPos, yPos, zPos);
  }
}