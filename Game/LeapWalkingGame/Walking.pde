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
    indexFingerOld = indexFingerCurrent.copy();
    middleFingerOld = middleFingerCurrent.copy(); //speichere die MiddleFinger Werte der vorherigen Runde in den "Alt"-Werten

    indexFingerCurrent = hand.getIndexFinger().getPosition();
    middleFingerCurrent = hand.getMiddleFinger().getPosition(); //hole die aktuellen Positionen von Mittel und Zeigefinger

    PVector indexFingerMovement = indexFingerCurrent.copy();
    indexFingerMovement.sub(indexFingerOld);
    PVector middleFingerMovement = middleFingerCurrent.copy();
    middleFingerMovement.sub(middleFingerOld);


    if (
      (indexFingerMovement.y * middleFingerMovement.y < -1 || indexFingerMovement.x * middleFingerMovement.x < -1) ) {
      if (lastIsWalking) {
        character.isWalking = true;
      } else {
        lastIsWalking = true;
      }
    } else {
      if (!lastIsWalking) {
        character.isWalking = false;
      } else {
        lastIsWalking = false;
      }
    }


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