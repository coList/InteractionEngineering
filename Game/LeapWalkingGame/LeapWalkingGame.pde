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


float startTime = 5000;
boolean gameStarted = false;
boolean gameStopped = false;

float releaseStopTime = 0;

void setup() {
  size(1800, 1000, P3D);  
  background(0);  

  field = new Field();
  field.render();
  obstacleCreator = new ObstacleCreator(field.totalDistance);

  character = new Character(850, height/2+300, 0);
  gui = new GUI();



  duckDepthTranslation = new DuckDepthTranslation();
  jumpDepthTranslation = new JumpDepthTranslation();
  directionChange = new DirectionChange();
  walking = new Walking();

  leap = new LeapMotion(this);

  dataPrinter = new DataPrinter("data.txt");
}


void draw() { 
  if (!character.reachedEnd(field.totalDistance)) {
    background(000);
    lights();
    camera(width/2, height/3, character.cameraEyeZ, width/2, height/2, character.cameraCenterZ, 0, 1, 0);
    field.render();
    character.render();

    obstacleCreator.createObstacles();


    for (Hand hand : leap.getHands ()) {
      if (hand.isLeft() && !usingRightHand || hand.isRight() && usingRightHand) {
        directionChange.setDirection(character, hand);

        walking.setIsWalking(character, hand);
        jumpDepthTranslation.updateDepthPosition(character, hand, gameStopped);

        Arm arm = hand.getArm();
        duckDepthTranslation.updateDepthPosition(character, arm, gameStopped);
        
        
        
        
        gui.renderHand(hand);
        
      }
    }

    gui.render(character, field, gameStarted);


    if (gameStarted && !gameStopped) {
      character.move();

      for (Obstacle obstacle : obstacleCreator.obstacles) {
        boolean stop = character.collisionObstacle(obstacle);
        if (stop) {
          gameStopped = true;
        }
      }

      if (gameStopped) {
        releaseStopTime = millis() + 1000;
      }
    } else if (!gameStarted) {
      float timeLeft = startTime - millis();
      if (timeLeft < 0) {
        gameStarted = true;
      } else {
        gui.showStarter(timeLeft);
      }
    } else {
      if (releaseStopTime <= millis()) {
        gameStopped = false;
      }
    }
  } else {
    if (!dataPrinted) {
      time = millis();
      dataPrinted = true;

      dataPrinter.printData("TotalDistance: " + field.totalDistance + ";" + "Collisions: " + character.collisionsCount + ";" + "Time: " + time + ";" + "Jumps: " + jumpDepthTranslation.jumpCounter + ";" + "Ducks: " + duckDepthTranslation.duckCounter + ";");
      dataPrinter.saveData();
    }

    gui.showEndScreen(character, time);
   
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

public void exit() {  //save Data on Window exit
  dataPrinter.saveData();
  super.exit();
}