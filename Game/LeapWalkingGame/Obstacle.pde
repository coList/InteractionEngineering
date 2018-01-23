class Obstacle {  
  int lane;
  boolean high;
  PVector position; //Position: Mitte des Objektes
  int boxWidth= 300;
  int boxHeight= 100;
  int boxDepth= 50;

  Obstacle(int lane, boolean high, int zPos) {   
    this.lane = lane;
    this.high= high;
    position = new PVector(calculateXPos(), 0, zPos);
  }

  void render() {
    pushMatrix();
    if (high) {
      position.y = height/2;
      translate(position.x, position.y, position.z);

      //linke Säule
      pushMatrix();
      translate(-boxWidth/2+10, 175, 0);      
      box(20, 250, 50);     
      popMatrix();

      //rechte Säule
      pushMatrix();
      translate(boxWidth/2-10, 175, 0);      
      box(20, 250, 50);     
      popMatrix();
    } else {
      position.y = height/2 + 250;
      translate(position.x, position.y, position.z);
    }
    stroke(200, 200, 200);
    fill(70);
    box(boxWidth, boxHeight, boxDepth);
    popMatrix();
  }

  int calculateXPos() {
    return width/2-350+(this.lane*350);
  }
}