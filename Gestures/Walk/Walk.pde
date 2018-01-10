import de.voidplus.leapmotion.*;


LeapMotion leap;
Character character;
Walking walking;
boolean usingRightHand = true;
String rightHand = "Du verwendest die rechte Hand. Drücke Enter zum Wechseln.";
String leftHand = "Du verwendest die linke Hand. Drücke Enter zum Wechseln.";

void setup() {
  size(1600, 1000, OPENGL);
  character = new Character(width/2, height/2, 50);
  walking = new Walking();
  leap = new LeapMotion(this);
}

void draw() {
  background(255);
  character.render();
  character.move();

  strokeWeight(5);
  if (usingRightHand) {
    text(rightHand, 20, 20);
  } else {
    text(leftHand, 20, 20);
  }
  
  for (Hand hand : leap.getHands ()) {
    if (hand.isLeft() && !usingRightHand || hand.isRight() && usingRightHand) {
      walking.setIsWalking(character, hand);
    }
    hand.draw();
  }
  
}

void keyPressed() {
  if (keyCode == ENTER) {
    usingRightHand = !usingRightHand;
  }
}