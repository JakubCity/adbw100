class Ball{
  
  PVector position;
  PVector velocity;
  float diameter;
  int speed;


  Ball()
  {
    position = new PVector(500,700);
    velocity = new PVector(0,0);
    diameter = 25;
    speed = 0;
  }
  
  void draw()
  {
    fill(255,255,255);
    ellipse(position.x, position.y, diameter, diameter);
  }
  
  void start()
  {
    speed = 5;
    velocity.x = speed;
    velocity.y = -speed;
    position.x = 500;
    position.y = 700;
  }
  
  void move()
  {
    position.x += velocity.x;
    position.y += velocity.y;
    
    //left bound
    if (position.x < 0)
    {
      velocity.x = -1*velocity.x;
    }
    //right bound
    else if (position.x > width)
    {
      velocity.x = -1*velocity.x;
    }
    //top bound
    if (position.y < 0)
    {
      velocity.y = -1*velocity.y;
    }
  }
  void bounce(){
    velocity.x = -1*velocity.x;
    velocity.y = -1*velocity.y;
  }
}
