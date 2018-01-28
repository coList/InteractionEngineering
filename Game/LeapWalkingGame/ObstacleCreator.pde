class ObstacleCreator {  
  ArrayList<Obstacle> obstacles;

  ObstacleCreator(float totalDistance) {   
    obstacles = new ArrayList<Obstacle>();
    for (int i=-300; i>-totalDistance; i -= 500) {
      obstacles.add(new Obstacle(int(random(3)), boolean((int)random(0, 2)), i));
    } 
    
  }

  void createObstacles() {
    for (Obstacle obstacle : obstacles) {
      obstacle.render();
    }
  }

}