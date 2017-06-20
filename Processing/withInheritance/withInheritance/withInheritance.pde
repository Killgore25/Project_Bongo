/*
Application should simulate the robotic arm Bongo. Information 
 on the loading of the instructions. Information displayed about 
 each of the two stepper motors controlling the arm. Clearly show
 what the robot draws and if it is drawing or not. Uses inheritance
 to organize objects and classes.
 */

float gridInterval = 40;


BaseArm baseArm;
DrawArm drawArm;

void setup() {
  size(800, 950);
  baseArm = new BaseArm(560, 640, 3*PI/4);
  drawArm = new DrawArm(baseArm.end.x, baseArm.end.y,3*PI/4);
}

void draw() {
  background(150);
  //Show the grid for measurement reference
  drawGrid(gridInterval);
  noStroke();
  fill(222);
  rect(300,360,200,280);

//One function that calls all the different update functions
  updates();
//One function that calls all the different show functions
  shows();

}

void drawGrid(float interval) {
  strokeWeight(1);
  stroke(0);
  float xlines = width / interval;
  float ylines = height / interval;
  for (float i = 1; i <= xlines; i++) {
    for (float j = 1; j<= ylines; j++) {
      line(0, j* interval, width, j*interval);
    }
    line(i*interval, 0, i*interval, height);
  }
}


void updates(){
  baseArm.update();
  drawArm.update();
}

void shows(){
  baseArm.show();
  drawArm.show();
}