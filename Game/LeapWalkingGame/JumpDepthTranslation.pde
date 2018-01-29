class JumpDepthTranslation {
  int groundPlane = 0;
  int jumpAmplificationFactor = 4;
  
  int jumpCounter = 0;

  void updateDepthPosition(Character character, Hand hand, boolean gameStopped) {
    if (!character.autoMovement) {
      float zIndex = hand.getIndexFinger().getPositionOfJointTip().z; 
      zIndex -= 60;    
      zIndex = -zIndex;
      if (zIndex <=groundPlane) { //Abfangen von negativen Sprüngen
        zIndex = groundPlane;
      }   

      if (zIndex > 20 && character.allowsJumpDuck && !gameStopped) {
        character.jump = true;
        jumpCounter++;
      } else {
        character.jump = false;
      }
    }
  }
}