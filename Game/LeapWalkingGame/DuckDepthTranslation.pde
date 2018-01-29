class DuckDepthTranslation {
  int groundPlane = 0;
  int duckAmplificationFactor = 4;

  int duckCounter = 0;
  void updateDepthPosition(Character character, Arm arm, boolean gameStopped) {
    if (!character.autoMovement) {
      float zIndex = arm.getWristPosition().z; 

      zIndex -= 60;   
      zIndex = -zIndex;

      if (zIndex <=groundPlane) { //Abfangen von negativem Ducken
        zIndex = groundPlane;
      }     
      if (zIndex <= 15 && character.allowsJumpDuck && !gameStopped) {
        character.duck = true;
        duckCounter++;
      } else {
        character.duck = false;
      }
    }
  }
}