/*
This application should show a simulation of the robotic arm. There 
should be 2 motor objects attached to the arm segments. They should 
match the position of the real arm.
*/
float angleFirstMotor = QUARTER_PI;
float angleSecondMotor = 3*QUARTER_PI;



BaseArm baseArm = new BaseArm(300, 400, anglefirstMotor);
BaseArm secondArm;

void setup() {
  size(600, 800);
  baseArm.update();
  secondArm = new BaseArm(baseArm.tipPos.x,baseArm.tipPos.y, angleSecondMotor, false);
}

void setSecondArmMotorPos(){
    secondArm.othersTip = baseArm.getTipPos(baseArm.motorPos);
    secondArm.motorPos = secondArm.othersTip;
}

void draw() { 
  background(103);
  
  
  baseArm.update();
  baseArm.show();
  secondArm.update();
  setSecondArmMotorPos();
  secondArm.show();
  
  baseArm.currentAngle += .01;
  secondArm.currentAngle += .02;
  
}