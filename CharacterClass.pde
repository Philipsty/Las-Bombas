
class CharacterClass
{
int characterX=300;
int characterY=540;
boolean characterDirection;//direction images will face.true=right,false=left
boolean characterChosen;//true=finn,false=psy


CharacterClass(int x,int y)
{
  characterX=x;
  characterY=y;
}

void characterMovement(boolean characterChosen)
{
   //declare image variable
   PImage charImage;
   imageMode(CENTER);
   
   //moving right
   if(characterDirection==true)
   {
    
            //print finn(character one) facing right
            if(characterChosen==true)
            {
               charImage = loadImage("standing finn right.png");
               image(charImage, characterX,characterY,110,140);
            }
            
            //print psy(character two) facing right
            else if(characterChosen==false)
            {
               charImage = loadImage("psy1.png");
               image(charImage, characterX,characterY,110,130);
            }
   }
                     
   
   //moving lefft
   else if(characterDirection==false)
   {
            //print finn(character one) facing left
            if(characterChosen==true)
            {
               charImage = loadImage("standing finn left.png");
               image(charImage, characterX,characterY,110,140);
            }
            
            //print psy(character two) facing left
            else if(characterChosen==false)
            {
               charImage = loadImage("psy2.png");
               image(charImage, characterX,characterY,110,130);
            }        
   } 

}
void recoil()
//the character will move 10 spaces away from the bomb that it has hit
{
  if(characterX<500||characterX<100)//if character is 100 away from rught end of screen or 100 close to left end of screen
  {
    characterX+=100;//move right
  }
  else
  {
   characterX-=100; //move left
  }
}


//these methods return the coordinates of the character
public int getXCoord()
{
 return characterX; 
}

public int getYCoord()
{
 return characterY; 
}

 
void arrowKeysRight()
//this arrow key moves the characterto the right
{
  
          if(characterX<width-35)//if the x value is in range
         {
           characterX+=10;//move right
           characterDirection=true;//images will face right
           
         }
        
 } 
 
 void arrowKeysLeft()
 //this arrow key moves the characterto the right

 {
         
         if(characterX>35)//if the x value is in range
         {
           characterX-=10;//move left
           characterDirection=false;//images will face left

         }
 } 
 }
