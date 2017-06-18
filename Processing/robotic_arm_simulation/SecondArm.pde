class SecondArm {
  PVector motorPos;
  PVector tipPos = new PVector();
  float shaftLength = 100;
  float currentAngle;
  PVector referencePoint = new PVector();

  SecondArm(float initX, float initY, float angle) {
    motorPos = new PVector(initX, initY);
    othersTip = new PVector();
    currentAngle = angle;
    tipPos.x = shaftLength * cos(radians(currentAngle));
    tipPos.y = shaftLength * sin(radians(currentAngle));
  }
}