class JumpDepthTranslation {
  int groundPlane = 0;
  int jumpAmplificationFactor = 4;
  
  void updateDepthPosition(Character character, Hand hand) {
    float zIndex = hand.getIndexFinger().getPosition().z; 
    zIndex -= 60;    
    zIndex = -zIndex;
    if (zIndex <=groundPlane) { //Abfangen von negativen Sprüngen
      zIndex = groundPlane;
    }   
    
    if (zIndex > 15)  {
      character.jump = true;
    } else {
      character.jump = false;
    }
  }
}