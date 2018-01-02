class ObstacleCreator {  
  ArrayList<Obstacle> obstacles;
  
  ObstacleCreator(ArrayList<Obstacle> obstacles) {   
    this.obstacles = obstacles;
  }

  void createObstsacles() {
    for(Obstacle obstacle: obstacles) {
      obstacle.render();
    }
  }
  
  
}