class Character {  

  PVector position;  //Mitte der Unterseite
  boolean duck = false;
  boolean jump = true;
  PVector direction;
  PVector speed;
  float autoMovementZ = -12;
  boolean autoMovement = false;
  float autoMovementStartTime = 0;
  float autoMovementDuration = 800;
  float allowJumpDuckAgainTime = 500;
  boolean allowsJumpDuck = true;
  int collisionsCount = 0;
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
    speed = new PVector(0, 0, 0);
    direction = new PVector(0, 0, 0);
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
    if (autoMovement) {
      position.z += autoMovementZ;
      cameraEyeZ += autoMovementZ;
      cameraCenterZ += autoMovementZ;
      
      if (autoMovementStartTime + autoMovementDuration <= millis()) {  //stop jumping, stop ducking
        autoMovement = false;
      }
      
    } else if (isWalking) {
      position.x += speed.x;
      position.z += speed.z;

      if (position.x <= 300 + currentBoxWidth/2) {
        position.x = 300 + currentBoxWidth/2;
      } else if (position.x >= width - 300 - currentBoxWidth/2) {
        position.x = width - 300 - currentBoxWidth/2;
      }
      

      cameraEyeZ += character.speed.z;
      cameraCenterZ += character.speed.z;
    } else if ((jump || duck) && !autoMovement) {
       autoMovement = true;
       allowsJumpDuck = false;
       position.z += autoMovementZ;
      cameraEyeZ += autoMovementZ;
      cameraCenterZ += autoMovementZ;
       autoMovementStartTime = millis();
    }
    
    if (autoMovementStartTime + autoMovementDuration + allowJumpDuckAgainTime <= millis()) {
      allowsJumpDuck = true;
    }
  }
  
  boolean reachedEnd(float totalDistance) {
      if (position.z <= -totalDistance) {
        return true;
      }
      return false;
  }

  boolean collisionObstacle(Obstacle obstacle) {
    //Character Box linke Seite: position.x - currentBoxWidth/2
    //Character Box rechte Seite: position.x + currentBoxWidth/2
    //Character Box + Sphere obere Seite: positon.y + currentBoxHeight + sphereRadius*2
    //Character Box untere Seite: position.y
    //Character Box vordere Seite: position.z + currentBoxDepth/2
    //Character Box hintere Seite: position.z - currentBoxDepth/2

    //Obstacle !high linke Seite: obstacle.position.x - obstacle.boxWidth/2
    //Obstacle !high rechte Seite: obstacle.position.x + obstacle.boxWidth/2
    //Obstacle !high obere Seite: obstacle.position.y - obstacle.boxHeight/2
    //Obstacle !high untere Seite: obstacle.position.y + obstacle.boxHeight/2
    //Obstacle !high vordere Seite: obstacle.position.z + obstacle.boxDepth/2
    //Obstacle !high hintere Seite: obstacle.position.z - obstacle.boxDepth/2

    //Obstacle high Linke Säule linke Seite = obstacleLeft
    //Obstacle high Linke Säule rechte Seite = obstacleLeft + obstacle.pillarWidth
    //Obstacle high Linke Säule obere Seite = obstacleBottom
    //Obstacle high Linke Säule untere Seite = obstacleBottom + obstacle.pillarHeight
    //Obstacle high Linke Säule vordere Seite = obstacleFront
    //Obstacle high Linke Säule hintere Seite = obstacleBack

    //Obstacle high Rechte Säule linke Seite = obstacleRight - obstacle.pillarWidth
    //Obstacle high Rechte Säule rechte Seite = obstacleRight
    //Obstacle high Rechte Säule obere Seite = obstacleBottom
    //Obstacle high Rechte Säule untere Seite = obstacleBottom + obstacle.pillarHeight
    //Obstacle high Rechte Säule vordere Seite = obstacleFront
    //Obstacle high Rechte Säule hintere Seite = obstacleBack

    float characterLeft = position.x - currentBoxWidth/2;
    float characterRight = position.x + currentBoxWidth/2;
    float characterTop = position.y - currentBoxHeight - sphereRadius*2;
    float characterBottom = position.y;
    float characterFront = position.z + currentBoxDepth/2;
    float characterBack = position.z - currentBoxDepth/2;

    float obstacleLeft = obstacle.position.x - obstacle.boxWidth/2;
    float obstacleRight = obstacle.position.x + obstacle.boxWidth/2;
    float obstacleTop = obstacle.position.y - obstacle.boxHeight/2;
    float obstacleBottom = obstacle.position.y + obstacle.boxHeight/2;
    float obstacleFront = obstacle.position.z + obstacle.boxDepth/2;
    float obstacleBack = obstacle.position.z - obstacle.boxDepth/2;

    float pillar1Left = obstacleLeft;
    float pillar1Right = obstacleLeft + obstacle.pillarWidth;
    float pillar1Top = obstacleBottom;
    float pillar1Bottom = obstacleBottom + obstacle.pillarHeight;
    float pillar1Front = obstacleFront;
    float pillar1Back = obstacleBack;

    float pillar2Left = obstacleRight - obstacle.pillarWidth;
    float pillar2Right = obstacleRight;
    float pillar2Top = obstacleBottom;
    float pillar2Bottom = obstacleBottom + obstacle.pillarHeight;
    float pillar2Front = obstacleFront;
    float pillar2Back = obstacleBack;

    if ((characterLeft < obstacleRight && characterRight > obstacleLeft &&  //Kollision mit Balken
      characterTop < obstacleBottom && characterBottom > obstacleTop &&
      characterFront > obstacleBack && characterBack < obstacleFront) || 

      (obstacle.high && characterLeft < pillar1Right && characterRight > pillar1Left &&  //Kollision mit linker Säule
      characterTop < pillar1Bottom && characterBottom > pillar1Top &&
      characterFront > pillar1Back && characterBack < pillar1Front) ||

      (obstacle.high && characterLeft < pillar2Right && characterRight > pillar2Left &&  //Kollision mit rechter Säule
      characterTop < pillar2Bottom && characterBottom > pillar2Top &&
      characterFront > pillar2Back && characterBack < pillar2Front)) {

      position.z += 150;
      cameraEyeZ += 150;
      cameraCenterZ += 150;

      collisionsCount++;
      
      return true;
    }
    return false;
  }

  void setIsWalking(boolean isWalking) {
    this.isWalking = isWalking;
  }

  void setSpeed(PVector speed) {
    this.speed = speed;
  }

  void setDirection(PVector direction) {
    this.direction = direction;
  }

  void calculateSpeed(int speedValue) {
    speed = direction.copy();
    speed.mult(speedValue * 3);
  }

  void setCoordinates(float xPos, float yPos, float zPos) {
    position.set(xPos, yPos, zPos);
  }
}