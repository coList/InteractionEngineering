class DepthTranslation {
  int groundPlane = 70;
  int jumpAmplificationFactor = 4;
  void updateDepthPosition(Character character, Hand hand) {
    float zIndex = hand.getIndexFinger().getPosition().z; 
    if (zIndex >=groundPlane) { //Abfangen von negativen Sprüngen
      zIndex = groundPlane;
    }
    character.y = (zIndex *jumpAmplificationFactor) +300 ;   //y instead of z to make effect visible, +300 to put Character in the middle of the screen
  }
}