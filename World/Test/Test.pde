
Obstacle ob1;
ObstacleCreator obstacleCreator;
Character character;
Field field;

void setup() {
  size(1800, 1000, P3D);  
  background(0);
  
  ArrayList<Obstacle> obstacleList= new ArrayList<Obstacle>();
  obstacleList.add(new Obstacle(0, false, 0));
  obstacleList.add(new Obstacle(2, true, -300));
  obstacleList.add(new Obstacle(1, true, -600));
  obstacleList.add(new Obstacle(1, false, -900));
  obstacleList.add(new Obstacle(0, true, -1200));
  obstacleList.add(new Obstacle(2, true, -1500));
  obstacleList.add(new Obstacle(0, false, -1800));
  obstacleCreator = new ObstacleCreator(obstacleList);

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


void mousePressed() {
  // bewegt sich um 50 nach vorne
  character.setCoordinates(character.xPos, character.yPos, character.zPos-50);
}

void keyPressed() {
  //duckt sich
  character.duck = !character.duck;
}