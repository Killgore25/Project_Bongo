class BaseArm extends Motor {
  float len = 200;
  PVector end = new PVector();
  PVector base;
  boolean skeleton = false;
  
  //Some variables for drawing the segment
  PVector leftSeg = new PVector(0,0);
  PVector rightSeg = new PVector(0,0);
  float halfLen = len/2;


  BaseArm( float x, float y, float a) {
    super(x, y, a);
    base = new PVector(x, y);
    calcTip();
    super.rotationSpeed = -.01;
  }


  void show() {
      super.show();
      //if (skeleton == true) 
      stroke(0);
      //line(super.position.x, super.position.y, endPoint.x, endPoint.y);

      strokeWeight(2);
      line(base.x, base.y, leftSeg.x, leftSeg.y);
      line(base.x, base.y, rightSeg.x, rightSeg.y);
      line(leftSeg.x, leftSeg.y, end.x, end.y);
      line(rightSeg.x, rightSeg.y, end.x, end.y);
      ellipseMode(RADIUS);
      fill(67);
      ellipse(base.x, base.y, 10, 10);
  }

  void calcSegments(){
    leftSeg.x = base.x + (halfLen * cos(super.angle + PI/12));
    leftSeg.y = base.y - (halfLen * sin(super.angle + PI/12));
    rightSeg.x = base.x + (halfLen * cos(super.angle - PI/12));
    rightSeg.y = base.y - (halfLen * sin(super.angle - PI/12));
  }

  void calcTip(){
    float endX = base.x + (len * cos(super.angle));
    float endY = base.y - (len * sin(super.angle));
    end.set(endX, endY);
  }
  void update() {
    super.update();
    calcTip();
    calcSegments();
  }
}