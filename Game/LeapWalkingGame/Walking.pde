class Walking {
  PVector indexFingerOld;
  PVector indexFingerCurrent;

  PVector middleFingerOld;
  PVector middleFingerCurrent;

  float nextCalculationTime;
  float calculationTimeSteps = 100;
  float walkingStartValue = 2;  //benötigte Abstand zwischen alter und neuer Fingerposition
  
  boolean lastIsWalkingValue = false;

  
  Walking () {
    indexFingerOld = new PVector(0, 0);
    middleFingerOld = new PVector(0, 0);
    indexFingerCurrent = new PVector(0,0);
    middleFingerCurrent = new PVector(0,0);
    nextCalculationTime = calculationTimeSteps;
  }
  
  void setIsWalking(Character character, Hand hand) {
    indexFingerOld = indexFingerCurrent.copy();
    middleFingerOld = middleFingerCurrent.copy(); //speichere die MiddleFinger Werte der vorherigen Runde in den "Alt"-Werten
    
    indexFingerCurrent = hand.getIndexFinger().getPosition();
    middleFingerCurrent = hand.getMiddleFinger().getPosition(); //hole die aktuellen Positionen von Mittel und Zeigefinger
    
    PVector indexFingerMovement = indexFingerCurrent.copy();
    PVector middleFingerMovement = middleFingerCurrent.copy();
    
    indexFingerMovement.sub(indexFingerOld);
    middleFingerMovement.sub(middleFingerOld);
    
    float lengthIndexFingerMovement = indexFingerMovement.mag();
    float lengthMiddleFingerMovement = middleFingerMovement.mag();  //Berechnet die Länge des Vektors
    
    if (lengthIndexFingerMovement >= walkingStartValue && lengthMiddleFingerMovement >= walkingStartValue)  {
      if (lastIsWalkingValue) {
       character.setIsWalking(true);
      }
      lastIsWalkingValue = true;
    } else {
      if (!lastIsWalkingValue) {
      character.setIsWalking(false);
      }
      lastIsWalkingValue = false;
    }
    
    
  }

}