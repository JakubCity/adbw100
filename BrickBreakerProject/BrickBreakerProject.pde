boolean isPlay, victory, loss;
Ball ball;
Paddle paddle;
Brick[] bricks;

void setup(){
  size(1000,800);
  isPlay = false;
  victory = false;
  loss = false;
  ball = new Ball();
  paddle = new Paddle();
  bricks = new Brick[5];
  bricks[0] = new Brick(width/2, height/2);
  bricks[1] = new Brick(width/2 - 50, height/2 - 50);
  bricks[2] = new Brick(width/2 +50, height/2 + 50);
  bricks[3] = new Brick(width/2 + 50, height/2 - 50);
  bricks[4] = new Brick(width/2 - 50, height/2 + 50);
}

void draw(){
  background(150,150,150);
  
  if(!isPlay)
  {
    textSize(52);
    text("press x to begin", width/2 - 200, height/2);
  }
  else if(victory)
  {
    textSize(52);
    text("You win", width/2 - 200, height/2);
  }
  else if(loss)
  {
    textSize(52);
    text("You lose", width/2 - 200, height/2);
    isPlay = false;
  }
  
  else{
  ball.draw();

  paddle.draw();
  
  ball.move();
  
  //check for loss
  if(ball.position.y > height+10)
  {
    loss = true;
  }
  //check paddle colision
  if(collide(ball.position.x,ball.position.y,paddle.position.x,paddle.position.y,paddle.size,20)){
    ball.velocity.y = ball.velocity.y*-1;
  }
  
  //brick logic
  
  for (int i=0; i < bricks.length; i++)
  {
    bricks[i].draw();
    if(collide(ball.position.x,ball.position.y,bricks[i].position.x,bricks[i].position.y,bricks[i].size.x,bricks[i].size.y))
    {
      if(!bricks[i].isBroken){ball.bounce();}
      bricks[i].broke();
      
    }
    
  }
  if(bricks[0].isBroken && bricks[1].isBroken && bricks[2].isBroken && bricks[3].isBroken && bricks[4].isBroken)
  {
    victory = true;
  }
  }
  
  
}

void keyPressed(){
  
  switch(key)
  {
    case 'x' :
      if(!isPlay)
      {
        ball.start();
        isPlay=true;
        loss = false;
        paddle.position.x = width/2;
        for (int i=0; i < bricks.length; i++)
        {
          bricks[i].isBroken = false;
        }
      }
      break;
    case 'a' :
      paddle.move(false);
      break;
    case 'd' :
      paddle.move(true);
      break;
    default:
      break;
  }
}

boolean collide(float x1, float y1, float x2, float y2, float sizeX, float sizeY){
  if(x1 >= x2 - (sizeX/2) && x1 <= x2 + (sizeX/2) && y1 >= y2 - (sizeY/2) && y1 <= y2 + (sizeY/2)){
    return true;
  }
  else{
    return false;
  }
}
