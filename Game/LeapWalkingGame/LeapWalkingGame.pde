import de.voidplus.leapmotion.*;

ObstacleCreator obstacleCreator;
Character character;
Field field;
GUI gui;


LeapMotion leap;

DataPrinter dataPrinter;

//gestures
DuckDepthTranslation duckDepthTranslation;
JumpDepthTranslation jumpDepthTranslation;
DirectionChange directionChange;
Walking walking;

boolean usingRightHand = true;

boolean dataPrinted = false;
float time = 0;


void setup() {
  size(1800, 1000, P3D);  
  background(0);  

  obstacleCreator = new ObstacleCreator();

  character = new Character(850, height/2+300, 0);
  gui = new GUI();

  field = new Field();
  field.render();

  duckDepthTranslation = new DuckDepthTranslation();
  jumpDepthTranslation = new JumpDepthTranslation();
  directionChange = new DirectionChange();
  walking = new Walking();

  leap = new LeapMotion(this);
  
  dataPrinter = new DataPrinter("data.txt");
}


void draw() { 
  if (!character.reachedEnd()) {
    background(000);
    lights();
    camera(width/2, height/3, character.cameraEyeZ, width/2, height/2, character.cameraCenterZ, 0, 1, 0);
    field.render();
    character.render();
    character.move();

    obstacleCreator.createObstacles();


    for (Obstacle obstacle : obstacleCreator.obstacles) {
      character.collisionObstacle(obstacle);
    }


    for (Hand hand : leap.getHands ()) {
      if (hand.isLeft() && !usingRightHand || hand.isRight() && usingRightHand) {
        directionChange.setDirection(character, hand);

        walking.setIsWalking(character, hand);
        jumpDepthTranslation.updateDepthPosition(character, hand);

        Arm arm = hand.getArm();
        duckDepthTranslation.updateDepthPosition(character, arm);
      }
    }

    gui.render(character, field);
  } else {
    if (!dataPrinted) {
      time = millis();
      dataPrinted = true;
      
      dataPrinter.printData("Collisions: " + character.collisionsCount + ";" + "Time: " + time + ";");
      dataPrinter.saveData();
    }
    
    background(0);
    noLights();
    camera();
    
    fill(255);
    textSize(40);
    text("Finished!", 200, 300);
    text("Collisions: " + character.collisionsCount, 200, 400);
    text("Time: " + (int)time/1000 + "s", 200, 500);
    
  }
}

void mousePressed() {
  // bewegt sich um 50 nach vorne
  character.setCoordinates(character.position.x, character.position.y, character.position.z-50);
  character.cameraEyeZ -= 50;
  character.cameraCenterZ -= 50;
}

void keyPressed() {
  //duckt sich
  character.duck = !character.duck;

  if (keyCode == ENTER) {
    usingRightHand = !usingRightHand;
  }
}