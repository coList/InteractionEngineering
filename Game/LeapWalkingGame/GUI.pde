class GUI {
  int textSize = 40;
  int textColor = 255;
  
  void render(Character character, Field field, boolean gameStarted) {
   camera(); //setze den viewport auf 2d zurück
   noLights();   
   renderDistance(300, 100, character.position.z, field.totalDistance);
   renderCollisionsCount(800, 100, character.collisionsCount);
   renderSpeed(1100, 100, character.speed.z, gameStarted, character.isWalking, character.autoMovement, character.autoMovementZ);
   renderWalkingDirection(1400, 100, character.direction);
  }
  
  void renderDistance(int x, int y, float currentDistance, int totalDistance) {
    fill(textColor);
    textSize(textSize);
    text(abs((int)(currentDistance/10)) + "m/" + (int)(totalDistance/10) + "m", x, y);
  }
  
  void renderWalkingDirection(int x, int y, PVector walkingDirection) {
    stroke(textColor);
    strokeWeight(3);
    PVector direction = walkingDirection.copy();
    direction.normalize();
    int multiplier = 70;
    //baseline Arrow
 
    translate(x, y);
    line(0, 0,  (direction.x * multiplier), (direction.z * multiplier));
    
    //pfeilspitzen
    pushMatrix();
    translate(direction.x * multiplier, direction.z * multiplier);

    rotate(radians(45));
    line(0, 0,  -0.5 * direction.x * multiplier, -0.5 * direction.z* multiplier);
    rotate(radians(-90));
    line(0, 0, -0.5 * direction.x * multiplier, -0.5 * direction.z * multiplier);
    popMatrix();

    strokeWeight(1);
  }
  
  void renderSpeed(int x, int y, float speed, boolean gameStarted, boolean isWalking, boolean autoMovement, float autoSpeed) {
    fill(textColor);
    textSize(textSize);
    
    
    /*
    if (isWalking) {
      speed = 0;
    }
    
    if (autoMovement) {
      speed = autoSpeed;
    }
    */
    
    if (!gameStarted) {
      speed = 0;
    }
    text(-(int)speed + " m/s", x, y);
  }
  
  void renderCollisionsCount(int x, int y, int collisionsCount) {
    fill(textColor);
    textSize(textSize);
    text(collisionsCount + " Hits", x, y);
  }
  
  
  void showStarter(float timeLeft) {
    camera();
    noLights();
    fill(textColor);
    textSize(textSize * 10);
    text((int)timeLeft/1000, 100, height * 2/3);
  }
}