class DepthTranslation {
  int groundPlane = 0;
  int jumpAmplificationFactor = 4;
  void updateDepthPosition(Character character, Hand hand) {
    float zIndex = hand.getIndexFinger().getPosition().z; 
    zIndex -= 60;    
    zIndex = -zIndex;
    if (zIndex <=groundPlane) { //Abfangen von negativen Sprüngen
      zIndex = groundPlane;
    }
    
    //falls zeige und mittelfinger z-Wert gößer ?(abhängig von laufen) -> dann springen 
    println(zIndex);
    character.z = (zIndex * jumpAmplificationFactor ) ;   //y instead of z to make effect visible, +300 to put Character in the middle of the screen
  }
}