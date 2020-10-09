class Paddle{
  PVector position;
  float speed;
  float size;
  
  Paddle()
  {
    position = new PVector(width/2, 750);
    size = 100;
    speed = 10;
  }
  
  void draw()
  {
    rectMode(CENTER);
    rect(position.x, position.y, size, 20);
  }
  
  void move(boolean right)
  {
    if(right && position.x + (size/2) < width)
    {
      position.x+=speed;
    }
    else if(position.x - (size/2) > 0)
    {
      position.x-=speed;
    }
  }
      
}
