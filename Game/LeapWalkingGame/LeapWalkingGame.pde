import de.voidplus.leapmotion.*;

ObstacleCreator obstacleCreator;
ObstacleCreator obstacleCreator2;
Character character;
Field field;
GUI gui;


LeapMotion leap;

//gestures
DuckDepthTranslation duckDepthTranslation;
JumpDepthTranslation jumpDepthTranslation;
DirectionChange directionChange;
Walking walking;

boolean usingRightHand = true;


void setup() {
  size(1800, 1000, P3D);  
  background(0);  

  obstacleCreator = new ObstacleCreator(fillObstacleList());
  obstacleCreator2 = new ObstacleCreator(fillObstacleList());

  character = new Character(850, height/2+300, 0);
  gui = new GUI();

  field = new Field();
  field.render();

  duckDepthTranslation = new DuckDepthTranslation();
  jumpDepthTranslation = new JumpDepthTranslation();
  directionChange = new DirectionChange();
  walking = new Walking();

  leap = new LeapMotion(this);
}


void draw() { 
  background(000);
  lights();
  camera(width/2, height/2, character.cameraEyeZ, width/2, height/2, character.cameraCenterZ, 0, 1, 0);
  field.render();
  character.render();
  character.move();

  obstacleCreator.createObstacles();


  for (Obstacle obstacle : obstacleCreator.obstacles) {
    character.collisionObstacle(obstacle);
  }
  
  
  gui.render(character, field);

  for (Hand hand : leap.getHands ()) {
    if (hand.isLeft() && !usingRightHand || hand.isRight() && usingRightHand) {
      directionChange.setDirection(character, hand);

      walking.setIsWalking(character, hand);
      jumpDepthTranslation.updateDepthPosition(character, hand);

      Arm arm = hand.getArm();
      duckDepthTranslation.updateDepthPosition(character, arm);
    }
  }
}

ArrayList<Obstacle> fillObstacleList() {
  ArrayList<Obstacle> obstacleList= new ArrayList<Obstacle>();    
  for (int i=0; i>-10000; i -= 300) {
    obstacleList.add(new Obstacle(int(random(3)), randomBoolean(), i));
  }  
  return obstacleList;
}

boolean randomBoolean() {
  int number = int(random(0, 2));
  if (number==1) {
    return true;
  }
  return false;
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