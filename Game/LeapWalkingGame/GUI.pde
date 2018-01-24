class GUI {
  int textSize = 40;
  int textColor = 255;
  
  void render(Character character, Field field) {
   camera(); //setze den viewport auf 2d zurück
   noLights();   
   renderDistance(300, 100, character.position.z, field.totalDistance);
   renderCollisionsCount(800, 100, character.collisionsCount);
   renderSpeed(1100, 100, character.speed.z);
   renderWalkingDirection(1400, 100, character.direction);
  }
  
  void renderDistance(int x, int y, float currentDistance, int totalDistance) {
    fill(textColor);
    textSize(textSize);
    text(abs((int)currentDistance) + "m/" + (int)totalDistance + "m", x, y);
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
  
  void renderSpeed(int x, int y, float speed) {
    fill(textColor);
    textSize(textSize);
    text(-(int)speed + " m/s", x, y);
  }
  
  void renderCollisionsCount(int x, int y, int collisionsCount) {
    fill(textColor);
    textSize(textSize);
    text(collisionsCount + " Hits", x, y);
  }
}