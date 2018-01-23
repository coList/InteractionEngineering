class ObstacleCreator {  
  ArrayList<Obstacle> obstacles;

  ObstacleCreator() {   
    obstacles = new ArrayList<Obstacle>();
    for (int i=0; i>-10000; i -= 300) {
      obstacles.add(new Obstacle(int(random(3)), boolean((int)random(0, 2)), i));
    } 
    
  }

  void createObstacles() {
    for (Obstacle obstacle : obstacles) {
      obstacle.render();
    }
  }

}