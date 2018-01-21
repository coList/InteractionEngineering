class DuckDepthTranslation {
  int groundPlane = 0;
  int duckAmplificationFactor = 4;
  
  void updateDepthPosition(Character character, Arm arm) {
    float zIndex = arm.getWristPosition().z; 
    zIndex -= 60;    
    zIndex = -zIndex;
    if (zIndex <=groundPlane) { //Abfangen von negativem Ducken
      zIndex = groundPlane;
    }     
    //println(zIndex);
    if (zIndex <= 20) {
      character.duck = true;
    } else {
      character.duck = false;
    }
    //character.position.z = (zIndex * duckAmplificationFactor ) ;   
  }
}