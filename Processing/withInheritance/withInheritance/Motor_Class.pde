class Motor{
  float angle;
  float rotationSpeed;
  PVector position;
  
  
  
  Motor(float x, float y, float angle){
    position = new PVector(x,y);
    this.angle = angle;
  }
  
  
  void show(){
    stroke(67);
    fill(67);
    ellipseMode(RADIUS);
    ellipse(position.x,position.y,20,20);
  }
  
  void update(){
    angle += rotationSpeed;
  }
}