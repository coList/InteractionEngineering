class Obstacle {  
  int lane;
  String obstaclePosition;
  int zPos;

  Obstacle(int lane, String obstaclePosition, int zPos) {   
    this.lane = lane;
    this.obstaclePosition= obstaclePosition;
    this.zPos = zPos;
  }

  void render() {
    pushMatrix();
    if (obstaclePosition.equals("low")) {
      translate(calculateXPos(), height/2+200, this.zPos);
    } else {
      translate(calculateXPos(), height/2, this.zPos);
    }
    noStroke();
    fill(70);
    box(300, 100, 50);
    popMatrix();
  }
  
  int calculateXPos(){
    return width/2-450+(this.lane*450);
  }
}