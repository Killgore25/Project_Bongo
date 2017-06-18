#include <AccelStepper.h>


AccelStepper stepper1(8, 9, 10, 11);


void setup() {
  // put your setup code here, to run once:
  stepper1.setMaxSpeed(900.0);
  stepper1.setAcceleration(700.0);
  
  pinMode(8,OUTPUT);
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  
}

void loop() {
  // put your main code here, to run repeatedly:
  if (stepper1.distanceToGo() == 0) {
    stepper1.moveTo(random(1500, 7000));
  }
  stepper1.run();

}
