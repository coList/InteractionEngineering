class GUI {
  int textSize = 40;
  int textColor = 255;
  int ellipsesSize = 20;

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
    line(0, 0, (direction.x * multiplier), (direction.z * multiplier));

    //pfeilspitzen
    pushMatrix();
    translate(direction.x * multiplier, direction.z * multiplier);

    rotate(radians(45));
    line(0, 0, -0.5 * direction.x * multiplier, -0.5 * direction.z* multiplier);
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

  void showEndScreen(Character character, float time) {
    background(0);
    noLights();
    camera();

    fill(255);
    textSize(40);
    text("Finished!", 200, 300);
    text("Collisions: " + character.collisionsCount, 200, 400);
    text("Time: " + (int)time/1000 + "s", 200, 500);
    
    String funText = "";
    if (character.collisionsCount == 0) {
      funText = "No cut, no bruise, no nothing... \nCrazy!"; 
    } else if (character.collisionsCount <= 5) {
      funText = "A broken leg, some bruises... \nNot too bad";
    } else if (character.collisionsCount <= 10) {
      funText = "3 broken rips, a broken leg, \nbut at least you finished!";
    } else {
      funText = "Your poor body...";
    }
    textSize(30);
    text('"' + funText + '"', width/2, 2*height/3); 
  }
  
  void renderHand(Hand hand) {
    PVector indexFingerTip = hand.getIndexFinger().getPositionOfJointTip();
    PVector  middleFingerTip = hand.getMiddleFinger().getPositionOfJointTip();
    PVector indexFingerMcp = hand.getIndexFinger().getPositionOfJointMcp();
    PVector  middleFingerMcp = hand.getMiddleFinger().getPositionOfJointMcp();
    PVector indexFingerPip = hand.getIndexFinger().getPositionOfJointPip();
    PVector  middleFingerPip = hand.getMiddleFinger().getPositionOfJointPip();
    PVector indexFingerDip = hand.getIndexFinger().getPositionOfJointDip();
    PVector  middleFingerDip = hand.getMiddleFinger().getPositionOfJointDip();
    
    camera();
    noLights();
    
    pushMatrix();
    fill(255);
    scale(0.5,0.5);
    
    ellipse(indexFingerMcp.x, indexFingerMcp.y, ellipsesSize, ellipsesSize);
    ellipse(middleFingerMcp.x, middleFingerMcp.y, ellipsesSize, ellipsesSize);
    
    ellipse(indexFingerPip.x, indexFingerPip.y, ellipsesSize, ellipsesSize);
    ellipse(middleFingerPip.x, middleFingerPip.y, ellipsesSize, ellipsesSize);
      
    ellipse(indexFingerDip.x, indexFingerDip.y, ellipsesSize, ellipsesSize);
    ellipse(middleFingerDip.x, middleFingerDip.y, ellipsesSize, ellipsesSize);
    
    
    strokeWeight(ellipsesSize/3);
    
    line(indexFingerTip.x, indexFingerTip.y, indexFingerDip.x, indexFingerDip.y);
    line(middleFingerTip.x, middleFingerTip.y, middleFingerDip.x, middleFingerDip.y);
    
    line(indexFingerPip.x, indexFingerPip.y, indexFingerDip.x, indexFingerDip.y);
    line(middleFingerPip.x, middleFingerPip.y, middleFingerDip.x, middleFingerDip.y);
    
    line(indexFingerPip.x, indexFingerPip.y, indexFingerMcp.x, indexFingerMcp.y);
    line(middleFingerPip.x, middleFingerPip.y, middleFingerMcp.x, middleFingerMcp.y);
    
    
    fill(255,0,0);
    noStroke();
    ellipse(indexFingerTip.x, indexFingerTip.y, ellipsesSize, ellipsesSize);
    ellipse(middleFingerTip.x, middleFingerTip.y, ellipsesSize, ellipsesSize);
    
    
    popMatrix();
  }
}