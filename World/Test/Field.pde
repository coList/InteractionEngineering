class Field {  

  void render() {
    pushMatrix();
    rectMode(CENTER);
    fill(51);
    stroke(255);
    translate(0, height/2+300, 0);//nur y
    pushMatrix();
    rotateX(PI/2);  
    rect(width/2, height/2, width-600, 30000); //plane
    popMatrix();
    drawVerticalLines();
    drawHoritontalLines(400);
    popMatrix();
  }

  void drawVerticalLines() {
    line(width/2-200, 0, 500, width/2-200, 0, -30000);
    line(width/2+200, 0, 500, width/2+200, 0, -30000);
  }

  void drawHoritontalLines(int distance) {
    for (int i=0; i>(-30000); i-=distance) {
      line(width/2-600, 0, 500+i, width/2+600, 0, 500+i);
    }
  }
}