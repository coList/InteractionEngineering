class Field {  
  int totalDistance = 30000;
  void render() {
    pushMatrix();
    rectMode(CENTER);
    fill(51);
    stroke(255);
    translate(0, height/2+300, 0);//nur y
    pushMatrix();
    rotateX(PI/2);  
    rect(width/2, height/2, width-600, totalDistance); //plane
    popMatrix();
    drawVerticalLines();
    drawHoritontalLines(400);
    popMatrix();
  }

  void drawVerticalLines() {
    line(width/2-200, 0, 500, width/2-200, 0, -totalDistance);
    line(width/2+200, 0, 500, width/2+200, 0, -totalDistance);
  }

  void drawHoritontalLines(int distance) {
    for (int i=0; i>(-totalDistance); i-=distance) {
      line(width/2-600, 0, 500+i, width/2+600, 0, 500+i);
    }
  }
}