class Obstacle {  
  int lane;
  boolean high;
  PVector position; //Position: Mitte des Objektes
  int boxWidth= 300;
  int boxHeight= 100;
  int boxDepth= 50;
  
  int pillarWidth = 20;
  int pillarHeight = 250;
  int pillarDepth = 50;
  
  PVector positionPillar1;
  PVector positionPillar2;

  Obstacle(int lane, boolean high, int zPos) {   
    this.lane = lane;
    this.high= high;
    position = new PVector(calculateXPos(), 0, zPos);
    positionPillar1 = new PVector(-boxWidth/2+10, 175, 0);  //position nach dem ersten Translate
    positionPillar2 = new PVector(boxWidth/2-10, 175, 0);  //position nach dem ersten Translate
  }

  void render() {
    pushMatrix();
    if (high) {
      position.y = height/2;
      translate(position.x, position.y, position.z);

      //linke Säule
      pushMatrix();
      translate(positionPillar1.x, positionPillar1.y, positionPillar1.z);      
      box(pillarWidth, pillarHeight, pillarDepth);     
      popMatrix();

      //rechte Säule
      pushMatrix();
      translate(positionPillar2.x, positionPillar2.y, positionPillar2.z);      
      box(pillarWidth, pillarHeight, pillarDepth);     
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