class JumpDepthTranslation {
  int groundPlane = 0;
  int jumpAmplificationFactor = 4;
  
  int jumpCounter = 0;

  void updateDepthPosition(Character character, Hand hand, boolean gameStopped) {
    if (!character.autoMovement) {
      float zIndex = hand.getIndexFinger().getPositionOfJointTip().z; 
      float zMiddle = hand.getMiddleFinger().getPositionOfJointTip().z;
      
      zIndex -= 60;    
      zIndex = -zIndex;
      
      zMiddle -= 60;
      zMiddle = -zMiddle;
      
      if (zIndex > 20 && zMiddle > 20 && character.allowsJumpDuck && !gameStopped) {
        character.startJumpDuckMovement();
        character.jump = true;
        jumpCounter++;
      } else {
        character.jump = false;
      }
    }
  }
}