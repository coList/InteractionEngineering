import de.voidplus.leapmotion.*;


LeapMotion leap;
Character character;
DirectionChange directionChange;
Walking walking;
JumpDepthTranslation jumpDepthTranslation;
DuckDepthTranslation duckDepthTranslation;

boolean usingRightHand = true;
String rightHand = "Du verwendest die rechte Hand. Drücke Enter zum Wechseln.";
String leftHand = "Du verwendest die linke Hand. Drücke Enter zum Wechseln.";
void setup() {
  size(1600, 1000, P3D);
  character = new Character(width/2, height/2, 0, 50);
  directionChange = new DirectionChange();
  walking = new Walking();
  jumpDepthTranslation = new JumpDepthTranslation();
  duckDepthTranslation = new DuckDepthTranslation();
  leap = new LeapMotion(this);
}

void draw() {
  background(255);
  character.render();
  character.move();

  if (usingRightHand) {
    text(rightHand, 20, 20);
  } else {
    text(leftHand, 20, 20);
  }
  
  for (Hand hand : leap.getHands ()) {
    if (hand.isLeft() && !usingRightHand || hand.isRight() && usingRightHand) {
      directionChange.setDirection(character, hand);
      
      walking.setIsWalking(character, hand);
      jumpDepthTranslation.updateDepthPosition(character, hand);
      
      Arm arm = hand.getArm();
      duckDepthTranslation.updateDepthPosition(character, arm);
    }
    hand.draw();
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    usingRightHand = !usingRightHand;
  } else if (keyCode == ' ') {
    character.isWalking = !character.isWalking;
  }
}