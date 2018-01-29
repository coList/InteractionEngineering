class JumpDepthTranslation {
  int groundPlane = 0;
  int jumpAmplificationFactor = 4;
  
  int jumpCounter = 0;

  void updateDepthPosition(Character character, Hand hand) {
    if (!character.autoMovement) {
      float zIndex = hand.getIndexFinger().getPosition().z; 
      zIndex -= 60;    
      zIndex = -zIndex;
      if (zIndex <=groundPlane) { //Abfangen von negativen Sprüngen
        zIndex = groundPlane;
      }   

      if (zIndex > 15 && character.allowsJumpDuck) {
        character.jump = true;
        jumpCounter++;
      } else {
        character.jump = false;
      }
    }
  }
}