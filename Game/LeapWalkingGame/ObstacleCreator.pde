class ObstacleCreator {  
  ArrayList<Obstacle> obstacles;
  
  int obstacleDistance = 650;
  int obstacleBoxDepth = 50;

  ObstacleCreator(float totalDistance, int fieldWidth) {   
    obstacles = new ArrayList<Obstacle>();
    for (int i=-600; i>-totalDistance; i -= obstacleDistance) {
      obstacles.add(new Obstacle(int(random(3)), boolean((int)random(0, 2)), i, obstacleBoxDepth, fieldWidth));
    } 
    
  }

  void createObstacles() {
    for (Obstacle obstacle : obstacles) {
      obstacle.render();
    }
  }

}