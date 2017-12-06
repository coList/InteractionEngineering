import de.voidplus.leapmotion.*;

LeapMotion leap;

void setup() {
  size(800, 500, OPENGL);
  leap = new LeapMotion(this);
}

void draw() {
  background(255);
  int fps = leap.getFrameRate();
  text(fps + " fps", 20, 20);

  for (Hand hand : leap.getHands ()) {
    hand.draw();
  }
}