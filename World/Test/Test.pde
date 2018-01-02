
Obstacle ob1;
ObstacleCreator obstacleCreator;
void setup() {
  size(1800, 1000, P3D);  
  background(0);
  lights();
  background(0);

  pushMatrix();
  rectMode(CENTER);
  fill(51);
  stroke(255);
  translate(0, height/2+300, 0);
  rotateX(PI/2);
  rect(width/2, height/2, width-400, 30000); //plane
  popMatrix();

  
  
   ArrayList<Obstacle> obstacleList= new ArrayList<Obstacle>();
  obstacleList.add(new Obstacle(0, "low", 0));
  obstacleList.add(new Obstacle(2, "high", -300));
  obstacleList.add(new Obstacle(1, "high", -600));
  obstacleList.add(new Obstacle(1, "low", -900));
  obstacleCreator = new ObstacleCreator(obstacleList);
  obstacleCreator.createObstsacles();

 
}

void draw() {
  ob1.render();
  
}