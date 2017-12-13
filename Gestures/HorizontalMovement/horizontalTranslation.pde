class HorizontalTranslation {
  boolean isWalking = true;

  void updateHorizontalPosition(Character character, Hand hand) {
    if (isWalking) {
      float xIndex = hand.getIndexFinger().getPosition().x; 
      character.x = xIndex;   //update character position to indexFingerPosition
      if (xIndex >= width - character.size/2) {  //collision indexFingerPosition with Stage-Right
        character.x = width - character.size/2;
      } else if (xIndex <= character.size/2) {   //collision indexFingerPosition with Stage-Left
        character.x = character.size/2;
      }
    }
  }
}