class DirectionChange {
  void setDirection(Character character, Hand hand) {
   
    PVector pinkyFingerMetacarpal = hand.getPinkyFinger().getPositionOfJointMcp();  //erster Joint des Fingers von der Hand aus gesehen (=Verbindung zur Hand)
    PVector indexFingerMetacarpal = hand.getIndexFinger().getPositionOfJointMcp();
    
    fill(255,0,0);
    ellipse(pinkyFingerMetacarpal.x, pinkyFingerMetacarpal.y, 15, 15);
    ellipse(indexFingerMetacarpal.x, indexFingerMetacarpal.y, 15, 15);
    
    line(indexFingerMetacarpal.x, indexFingerMetacarpal.y, pinkyFingerMetacarpal.x, pinkyFingerMetacarpal.y);  //draw line between both joints
    
    PVector fingerConnection = indexFingerMetacarpal;
    fingerConnection.sub(pinkyFingerMetacarpal);   //calculate Vector between those two points
    
    strokeWeight(10);
    line(100, 900, 100 + fingerConnection.x, 900 + fingerConnection.y);
    
    PVector direction = fingerConnection;
    direction.rotate(HALF_PI);   //rotate the vector by 90degrees to get the perpendicular vector
    
    line(100 + fingerConnection.x/2, 900 - fingerConnection.y/2, 100 + fingerConnection.x/2 + direction.x, 900 - fingerConnection.y/2 + direction.y);
    
    
    direction.normalize();
    println(direction);
    
    character.setSpeed(direction);
  }
}