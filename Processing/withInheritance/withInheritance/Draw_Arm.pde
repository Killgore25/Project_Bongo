class DrawArm extends Motor {
  PVector base;
  PVector tip;
  float len = 200;
  float halfLen = len/2;

  PVector newPos = new PVector();


  PVector leftSeg = new PVector(0, 0);
  PVector rightSeg = new PVector(0, 0);

  DrawArm(float x, float y, float a) {
    super(x, y, a);
    base = new PVector(x, y);
    tip = new PVector();
    calcTip();
    super.rotationSpeed = .02;
  }

  void show() {
    super.show();
    //if (skeleton == true) 
    stroke(0);
    //line(super.position.x, super.position.y, endPoint.x, endPoint.y);

    strokeWeight(2);
    line(base.x, base.y, leftSeg.x, leftSeg.y);
    line(base.x, base.y, rightSeg.x, rightSeg.y);
    line(leftSeg.x, leftSeg.y, tip.x, tip.y);
    line(rightSeg.x, rightSeg.y, tip.x, tip.y);
    ellipseMode(RADIUS);
    fill(67);
    ellipse(base.x, base.y, 10, 10);
  }

  void calcSegments() {
    leftSeg.x = base.x + (halfLen * cos(super.angle + PI/18));
    leftSeg.y = base.y - (halfLen * sin(super.angle + PI/18));
    rightSeg.x = base.x + (halfLen * cos(super.angle - PI/18));
    rightSeg.y = base.y - (halfLen * sin(super.angle - PI/18));
  }

  void getNewPos(PVector otherTip) {
    newPos.set(otherTip);
    base = newPos;
    super.position = newPos;
  }

  void calcTip() {

    float endX = base.x + (len * cos(super.angle));
    float endY = base.y - (len * sin(super.angle));
    tip.set(endX, endY);
  }

  void update() {
    super.update();
    getNewPos(baseArm.end);
    calcTip();
    calcSegments();
  }
}