class Walking {
  PVector indexFingerOld;
  PVector indexFingerCurrent;

  PVector middleFingerOld;
  PVector middleFingerCurrent;

  PVector indexFingerMovementOld;
  PVector middleFingerMovementOld;

  int changes = 0;
  boolean printit = false;

  float nextTimer;

  boolean lastIsWalking;


  float nextCheck = 0;

  float stopCounter = 0;




  Walking () {
    indexFingerOld = new PVector(0, 0);
    middleFingerOld = new PVector(0, 0);
    indexFingerCurrent = new PVector(0, 0);
    middleFingerCurrent = new PVector(0, 0);

    indexFingerMovementOld = new PVector(0, 0);
    middleFingerMovementOld = new PVector(0, 0);

    nextTimer = millis() + 1000;
  }

  void setIsWalking(Character character, Hand hand) {
    if (nextCheck <= millis()) {
      indexFingerOld = indexFingerCurrent.copy();
      middleFingerOld = middleFingerCurrent.copy(); //speichere die MiddleFinger Werte der vorherigen Runde in den "Alt"-Werten

      indexFingerCurrent = hand.getIndexFinger().getPositionOfJointTip();
      middleFingerCurrent = hand.getMiddleFinger().getPositionOfJointTip(); //hole die aktuellen Positionen von Mittel und Zeigefinger

      PVector indexFingerMovement = indexFingerCurrent.copy();
      indexFingerMovement.sub(indexFingerOld);
      PVector middleFingerMovement = middleFingerCurrent.copy();
      middleFingerMovement.sub(middleFingerOld);

      float angleBetweenVectors = degrees(PVector.angleBetween(indexFingerMovement, middleFingerMovement));

      if (angleBetweenVectors >= 90 && angleBetweenVectors <= 180) {
        stopCounter = 0;
        character.isWalking = true;
      } else { 
        if (stopCounter > 2) {
          character.isWalking = false;
        }
        stopCounter++;
      }


      nextCheck = millis() + 200;

      if (indexFingerMovementOld.y * indexFingerMovement.y < 0) {  //nur in y-Richtung bisher
        changes++;
      }

      indexFingerMovementOld = indexFingerMovement.copy();

      if (nextTimer < millis()) {  //prüfe jede Sekunde auf Frequenz zur Geschwindigkeitsbestimmung
        nextTimer = millis() + 1000;
        character.calculateSpeed(changes);
        changes = 0;
      }
    }
  }
}