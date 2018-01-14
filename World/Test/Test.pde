ObstacleCreator obstacleCreator;
ObstacleCreator obstacleCreator2;
Character character;
Field field;

void setup() {
  size(1800, 1000, P3D);  
  background(0);  

  obstacleCreator = new ObstacleCreator(fillObstacleList());
  obstacleCreator2 = new ObstacleCreator(fillObstacleList());

  character = new Character(850, height/2+150, 0);

  field = new Field();
  field.render();
}

void draw() { 
  background(000);
  field.render();
  character.render();
  obstacleCreator.createObstsacles();
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
  character.setCoordinates(character.xPos, character.yPos, character.zPos-50);
}

void keyPressed() {
  //duckt sich
  character.duck = !character.duck;
}