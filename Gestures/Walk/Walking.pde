class Walking {
  PVector indexFingerOld;
  PVector indexFingerCurrent;

  PVector middleFingerOld;
  PVector middleFingerCurrent;

  float nextCalculationTime;
  float calculationTimeSteps = 120;
  float walkingStartValue = 0.02 * height;  //benötigter Abstand zwischen alter und neuer Fingerposition
  
  boolean lastIsWalkingValue = false;
  
  Walking () {
    indexFingerOld = new PVector(0, 0);
    middleFingerOld = new PVector(0, 0);
    indexFingerCurrent = new PVector(0,0);
    middleFingerCurrent = new PVector(0,0);
    nextCalculationTime = calculationTimeSteps;
  }

  void setIsWalking(Character character, Hand hand) {
    float currentTime = millis();
    if (currentTime >= nextCalculationTime) {
      nextCalculationTime = currentTime + calculationTimeSteps;
      indexFingerOld.x = indexFingerCurrent.x;
      indexFingerOld.y = indexFingerCurrent.y;
      middleFingerOld.x = middleFingerCurrent.x;
      middleFingerOld.y = middleFingerCurrent.y;

      indexFingerCurrent = hand.getIndexFinger().getPosition();
      middleFingerCurrent = hand.getMiddleFinger().getPosition();

      float indexFingerMovementY = indexFingerCurrent.y - indexFingerOld.y; //Abstand Indexfinger alte und neue Position
      float middleFingerMovementY = middleFingerCurrent.y - middleFingerOld.y; //Abstand Mittelfinger alte und neue Position

      println("indexFingerMovement " + indexFingerMovementY);
      println("middleFingerMovement " + middleFingerMovementY);
      
      if (abs(indexFingerMovementY) >= walkingStartValue && abs(middleFingerMovementY) >= walkingStartValue) {
        if (lastIsWalkingValue) {  //zum Abfangen von falschen "Rucklern"
        character.setIsWalking(true);
        }
        lastIsWalkingValue = true;
      } else {
        if (!lastIsWalkingValue) { //zum Abfangen von falschen "Rucklern"
        character.setIsWalking(false);
        }
        lastIsWalkingValue = false;
      }
    }
  }
}