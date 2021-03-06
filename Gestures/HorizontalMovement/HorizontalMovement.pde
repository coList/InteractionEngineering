import de.voidplus.leapmotion.*;


LeapMotion leap;
Character character;
HorizontalTranslation horizontalTranslation;

boolean usingRightHand = true;
String rightHand = "Du verwendest die rechte Hand. Drücke Enter zum Wechseln.";
String leftHand = "Du verwendest die linke Hand. Drücke Enter zum Wechseln.";
void setup() {
  size(1600, 1000, OPENGL);
  character = new Character(width/2, height/2, 50);
  horizontalTranslation = new HorizontalTranslation();
  leap = new LeapMotion(this);
}

void draw() {
  background(255);
  character.render();

  if (usingRightHand) {
    text(rightHand, 20, 20);
  } else {
    text(leftHand, 20, 20);
  }
  
  for (Hand hand : leap.getHands ()) {
    if (hand.isLeft() && !usingRightHand || hand.isRight() && usingRightHand) {  //use the hand, that the user selected
      horizontalTranslation.updateHorizontalPosition(character, hand);
    }
    hand.draw();
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    usingRightHand = !usingRightHand;   //change selected hand
  }
}