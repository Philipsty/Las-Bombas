
class Bombs
{
  

PImage bomb;
float x;
float y;
int speed;

int scoreAdd;//value that will be added to the score in the main
int score=0;
 
  
  
 Bombs(float xPos, float yPos, int bombSpeed)
 {
   x = xPos;
   y = yPos;
   speed = bombSpeed;
 }


void bombDisplay()
{
  if(510>y)
  {
  imageMode(CENTER);
  bomb = loadImage("bomb.png");
  image(bomb, x, y, 250, 250);
  }
}


void bombMoveDown()
//this method increase the y value of the bomb  
{
   
  y = y + speed;
  
  
  scoreAdd=0;//setting the value to zero
  
  if(520<=y&&y<=560)//when thebomb hits the ground an explosion will apear
  {
  explosion();
  }
  
  
  
  
   if (y > 560)
  {
  increaseSpeed();
  scoreAdd=10;//setting the scoreAdd variable to 10 so that when it is sent to the main 10 points will be added to score
  //reset bomb
  y = -60;
  float randNumber = int(random(5));
  x = (100*randNumber)+50;
    
  }
  
 
}


void increaseSpeed()
//this method increases the speed for every 20 points
{
  int modulus;
  
  //for every 10 points increase speed by 2
  if(speed<50)
  {
    speed+=4;
    println(speed); 
  }
  
  //for every 100 points the speed is reset
   modulus=score%100;
  
  if(modulus==0&&score>0)
  {
    speed=10;//speed set back to 10
  }
}

void explosion()
//this method displays an image of an exploding bomb
{
   PImage explode;
   imageMode(CENTER);
   explode = loadImage("explosion.png");
   image(explode, x,500,250,200);  
   
  
}
 
void syncSpeeds(int sped)
//this method will take the speed of bomb1 from the main and give it to the other bomb objects so that they move together
{
  speed=sped;
}

public int bombOneSpeed()
//this method will only be called with object bomb1. it will be used to sync its speed to the other bomb objects
{
  return speed;
}

 

public int scoreCalculator ()
//this method  calculates and returns a score of 10 to the main so to be added to the score in twhen a row of bombs has exploded or 
{
  score+=scoreAdd;
  return score;
}

//these methods return the coordinates of the bomb to the hitBomb() method so that it can check to see if a bomb has been hit
public float getXCoord()
{
 return x; 
}
public float getYCoord()
{
 return y; 
}

}


