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
    
    if (zIndex >= 10)  {
      character.jump = true;
    } else {
      character.jump = false;
    }
    //falls zeige und mittelfinger z-Wert gößer ?(abhängig von laufen) -> dann springen 
    //println(zIndex);
    //character.position.z = (zIndex * jumpAmplificationFactor ) ;   
  }
}