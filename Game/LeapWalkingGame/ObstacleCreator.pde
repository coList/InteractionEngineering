class ObstacleCreator {  
  ArrayList<Obstacle> obstacles;

  ObstacleCreator(float totalDistance) {   
    obstacles = new ArrayList<Obstacle>();
    for (int i=-600; i>-totalDistance; i -= 650) {
      obstacles.add(new Obstacle(int(random(3)), boolean((int)random(0, 2)), i));
    } 
    
  }

  void createObstacles() {
    for (Obstacle obstacle : obstacles) {
      obstacle.render();
    }
  }

}