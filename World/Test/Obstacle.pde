class Obstacle {  
  int lane;
  boolean high;
  int zPos;
  int boxWidth= 300;
  int boxHeight= 100;
  int boxDepth= 50;

  Obstacle(int lane, boolean high, int zPos) {   
    this.lane = lane;
    this.high= high;
    this.zPos = zPos;
  }  
  
  void render() {
    pushMatrix();
    if (high) {
      translate(calculateXPos(), height/2, this.zPos);
      
      //linke Säule
      pushMatrix();
      translate(-boxWidth/2+10,175,0);      
      box(20, 250,50);     
      popMatrix();
      
      //rechte Säule
      pushMatrix();
      translate(boxWidth/2-10,175,0);      
      box(20, 250,50);     
      popMatrix();
    } else {
      translate(calculateXPos(), height/2+250, this.zPos);
    }
    stroke(200,200,200);
    fill(70);
    box(boxWidth, boxHeight, boxDepth);
    popMatrix();
  }
  
  int calculateXPos(){
    return width/2-350+(this.lane*350);
  }
}