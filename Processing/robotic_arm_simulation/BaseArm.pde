class BaseArm {
  PVector motorPos;
  PVector tipPos = new PVector();
  float shaftLength = 100;
  float currentAngle;
  PVector referencePoint = new PVector();

  BaseArm(float initX, float initY, float angle) {
    motorPos = new PVector(initX, initY);
    othersTip = new PVector();
    currentAngle = angle;
    tipPos.x = shaftLength * cos(radians(currentAngle));
    tipPos.y = shaftLength * sin(radians(currentAngle));
  }
  /////////////Functions///////////////////
  PVector getTipPos(PVector motorPos) {
    float xDiff  = len * cos(currentAngle);
    float yDiff  = len * sin(currentAngle);
    tipPos.set(motorPos.x+xDiff,motorPos.y-yDiff);   
    return tipPos;
  }
  
  void update() {
    tipPos = getTipPos(motorPos);
    referencePoint.set(tipPos.x,motorPos.y);
    
  }
   
  void show() {
    //Draw each motor
    stroke(176);
    noFill();
    rectMode(CENTER);
    rect(motorPos.x, motorPos.y, 20,20);
    
    //Draw the tip
    stroke(255);
    ellipse(tipPos.x, tipPos.y, 15, 15);
    
    //Draw arm shaft
    strokeWeight(3);
    stroke(51);
    line(motorPos.x,motorPos.y,tipPos.x,tipPos.y);
  }
}