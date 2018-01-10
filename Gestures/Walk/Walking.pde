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
    
    
    println("indexFingerOld: " + indexFingerOld);
    println("indexFingerCurrent: " + indexFingerCurrent);
    println("Movement: " + indexFingerMovement);
    //println("indexFingerCurrentSub: " + indexFingerCurrent.sub(indexFingerOld));
    
    float lengthIndexFingerMovement = indexFingerMovement.mag();
    float lengthMiddleFingerMovement = middleFingerMovement.mag();  //Berechnet die Länge des Vektors
    
    println("lengthindexfinger: " + lengthIndexFingerMovement);
 
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

//  void setIsWalking(Character character, Hand hand) {
//    float currentTime = millis();
//    if (currentTime >= nextCalculationTime) {
//      nextCalculationTime = currentTime + calculationTimeSteps;
//      indexFingerOld.x = indexFingerCurrent.x;
//      indexFingerOld.y = indexFingerCurrent.y;
//      middleFingerOld.x = middleFingerCurrent.x;
//      middleFingerOld.y = middleFingerCurrent.y;

//      indexFingerCurrent = hand.getIndexFinger().getPosition();
//      middleFingerCurrent = hand.getMiddleFinger().getPosition();

//      float indexFingerMovementY = indexFingerCurrent.y - indexFingerOld.y; //Abstand Indexfinger alte und neue Position
//      float middleFingerMovementY = middleFingerCurrent.y - middleFingerOld.y; //Abstand Mittelfinger alte und neue Position

//      println("indexFingerMovement " + indexFingerMovementY);
//      println("middleFingerMovement " + middleFingerMovementY);
      
//      if (abs(indexFingerMovementY) >= walkingStartValue && abs(middleFingerMovementY) >= walkingStartValue) {
//        if (lastIsWalkingValue) {
//        character.setIsWalking(true);
//        }
//        lastIsWalkingValue = true;
//      } else {
//        if (!lastIsWalkingValue) {
//        character.setIsWalking(false);
//        }
//        lastIsWalkingValue = false;
//      }
//    }
//  }
}