
class Lives
{
int lifeAmount;
int[]lifePositions={150,200,250};//different positions that the y value will be printed in
int yPosition=650;
boolean characterDead=false;
PFont font;

Lives(int life)
{
  lifeAmount=life;
}
void printLives()
//this method prints the heart images on the screen according to the amount of lives the player has left
{
      //set font
      font = createFont("LAS BOMBAS FONT",20,true); 
      textFont(font);       
      fill(0);     
      textAlign(LEFT);
      text("LIVES:",40,yPosition); 
        
      for(int i=0;i<lifeAmount;i++)
      {
        PImage pixelHeart=loadImage("pixel_heart.png");
        imageMode(CENTER);
        image(pixelHeart, lifePositions[i],yPosition,50,50);
      }
      
}
    
public boolean noLives()
//this method returns a value to the main about whether or not the player has ran out of lives and the game is over 
{
      if(lifeAmount==0)
      {
        characterDead=true;
      }
      else
      {
        characterDead=false;
      }
      return characterDead;
}

void lostLife(int lost)
//this method will subtract the lifAmount by -1 when ever the user hits a bomb
{
  
  lifeAmount+=lost;
}
        
}

