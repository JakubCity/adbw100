class Brick{
  boolean isBroken;
  PVector position;
  PVector size;
  
  Brick(float x, float y)
  {
    isBroken = false;
    position = new PVector(x,y);
    size = new PVector(50,30);
    
  }
  
  void draw(){
    rectMode(CENTER);
    if(!isBroken)
    {
      fill(255,255,255);
      rect(position.x,position.y,size.x,size.y);
    }
  }
  void broke(){
    isBroken = true;
  }
}
