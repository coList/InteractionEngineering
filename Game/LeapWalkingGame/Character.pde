class Character {  

  PVector position;  //Mitte der Unterseite
  boolean duck = false;
  boolean jump = true;
  PVector speed;
  int collisionsCount = 5;
  boolean isWalking = false;
  
  int currentBoxWidth = 100;
  int currentBoxDepth = 100;
  int currentBoxHeight = 200;
  int sphereRadius = 50;
  
  int duckBoxHeight = 50;
  int standardBoxHeight = 200;
  int jumpPositionY;
  int standardPositionY;

  float cameraEyeZ = 800;
  float cameraCenterZ = 0;


  Character(int xPos, int yPos, int zPos) {  
    position = new PVector(xPos, yPos, zPos);
    standardPositionY = yPos;
    jumpPositionY = yPos - 200;
    speed = new PVector(5, 5, 5);
  }

  void render() {  
    if (duck) {
      currentBoxHeight = duckBoxHeight;
    } else {
      currentBoxHeight = standardBoxHeight;
    }
    
    if (jump) {
      position.y = jumpPositionY;
    } else {
      position.y = standardPositionY;
    }
       
    //Körper
    pushMatrix();
    translate(position.x, position.y-currentBoxHeight/2, position.z);
    box(currentBoxWidth, currentBoxHeight, currentBoxDepth);
    popMatrix();
    
    
    //Kopf
    pushMatrix();
    translate(position.x, position.y-currentBoxHeight-sphereRadius, position.z);
    sphere(50);
    popMatrix();
  }

  void move() {
    if (isWalking) {
      position.x += speed.x;
      position.z += speed.z;


      cameraEyeZ += character.speed.z;
      cameraCenterZ += character.speed.z;
    }
  }

  void collisionObstacle(Obstacle obstacle) {
    if (!obstacle.high) {
      /*
      if (position.z <= obstacle.zPos + obstacle.boxDepth/2 && position.z >= obstacle.zPos - obstacle.boxDepth/2 &&
        position.x >= obstacle.xPos - obstacle.boxWidth/2 && position.x <= obstacle.xPos + obstacle.boxWidth/2) {
        position.z += 150;
        cameraEyeZ += 150;
        cameraCenterZ += 150;
        println("hit");
      }
      */
      
      //Character linke Seite: position.x - currentBoxWidth/2
      //Character rechte Seite: position.x + currentBoxWidth/2
      //Character obere Seite: positon.y + currentBoxHeight
      //Character untere Seite: position.y
      //Character vordere Seite: position.z + currentBoxDepth/2
      //Character hintere Seite: position.z - currentBoxDepth/2
      
      //Obstacle !high linke Seite: obstacle.position.x - obstacle.boxWidth/2
      //Obstacle !high rechte Seite: obstacle.position.x + obstacle.boxWidth/2
      //Obstacle !high obere Seite: obstacle.position.y - obstacle.boxHeight/2
      //Obstacle !high untere Seite: obstacle.position.y + obstacle.boxHeigth/2
      //Obstacle !high vordere Seite: obstacle.position.z + obstacle.boxDepth/2
      //Obstacle !high hintere Seite: obstacle.position.z - obstacle.boxDepth/2
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