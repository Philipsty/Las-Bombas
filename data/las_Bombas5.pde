//Tyler Philips
//Las Bombas
//2015/01/12
//ICS4U

int loadBarx=120;
boolean loading=true;
boolean starting=false;
boolean pickCharacterScreenOpen=false;
boolean gameStarted=false;
boolean characterSet;
boolean dead=false;
boolean quitting=false;
int score=0;
  
PFont text;

//Bombs bombsMethods;



//linking the character class to the screens class
CharacterClass characterMethods;
lives livesMethods;
Bombs bomb1;

void setup()
{
 size(600,700); 
 smooth();
 frameRate(120);
 
 livesMethods=new lives();
 characterMethods=new CharacterClass();
 float randNumber = int(random(5));
 bomb1 = new Bombs((100*randNumber)+50, -60,  10);
}

void draw()
{
  
  
  checkLoad();
  checkStart();
  checkCharacterPick();
  checkGame();
  gameOver();


}

void checkLoad()
        {
             if (loading==true)
             {
              loadingScreen(); 
             }
              
              
        }
  
 void loadingScreen()
        {
         
            
               background(#FF6105); 
               
               //this draws a box where a loading bar will be shown
               rectMode(CENTER);
               fill(0);
               stroke(255);
               strokeWeight(5);
               rect(width/2,height/2,400,200);
               
              //this draws the loading bar and increases its length
               loadBarx+=10;
               rectMode(CORNERS);
               fill(#FCF508);
               rect(120,380,loadBarx,400);
               
              
              //initializing the text font
              text = createFont("LAS BOMBAS FONT",40,true); 
              textFont(text);       
              fill(255);
            
              textAlign(CENTER);
              text("LOADING...",width/2,340); 
              
              //when the loading bar is full the starting screen will appear
              if(loadBarx>470)
              {
                loading=false;
                starting=true;
              }
  
        }
      
      
    
void checkStart()
{
 if (starting==true)
 {
  startScreen();
 }
                    
}
        
                
    //this method creates the start screen , it will have a start button so the 
        //user can begin the game when they choose. There will also be instructions displayed .
void startScreen()
{
               background(#2EBAF0); 
               
               
               
               //this group of code will print an image of a button labeled start//////////////
              PImage button;
              imageMode(CENTER);
              button = loadImage("startbutton.png");
              image(button, width/2, 350, 150,150);
               
              //this group of code will print out instructions on playing the game /////////////
              textFont(text);       
              fill(255);
              textAlign(CENTER);
              
              //prints instructions on how to play the game
              text= createFont("LAS BOMBAS FONT",20,true); 
              text("Instructions\n--------------\nUse the LEFT and Right arrow keys\n to move your character and avoid bombs! ",width/2,560); 
                            
}
        

void checkCharacterPick()
{
 if (pickCharacterScreenOpen==true)
 {
   
 pickCharacterScreen();                
 }                                                            
}
        
void pickCharacterScreen()
{

        background(200,0,0); 
        pickCharacterBackDrop();  
      
        text = createFont("LAS BOMBAS FONT",40,true); 
        textFont(text);       
        fill(255);
            
        textAlign(CENTER);
        text("PICK YOUR CHARACTER",width/2,140); 
        
        rectMode(CENTER);
        
        //box 1
        fill(255);
        
        if((mouseX>90)&&(mouseX<290)&&(mouseY<500)&&(mouseY>200))//highlights left button
        {
          fill(#EDFF03);
        }
        
        stroke(0);
        strokeWeight(4);
        rect(190,350,200,300);
        
        PImage finnImage;
        imageMode(CENTER);
        finnImage = loadImage("standing finn right.png");
       image(finnImage, 190,350,190,220);
        
        
        //box2
        fill(255);
        if((mouseX>310)&&(mouseX<510)&&(mouseY<500)&&(mouseY>200))//highlights right button
        {
                   fill(#EDFF03);
        }

        stroke(0);
        rect(410,350,200,300);
        
        PImage psyImage;
        imageMode(CENTER);
        psyImage = loadImage("psy1.png");
        image(psyImage, 410, 350, 250,250);
         
            
  }

// create a spiral background
void pickCharacterBackDrop()
{
  
      background(200,0,0); 
      
      int x2=1;
      int change=10;
      int y2=1;
      ellipseMode(CENTER);
      
      while(y2<=1000)
      {
        
        ellipse(width/2,height/2,x2,y2);
        x2=x2+change;
        stroke(#FF721A);
        strokeWeight(2);
        noFill();
        y2=y2+change;
        
        
      }
}



void checkGame()
{
 if(gameStarted==true)
 {
  gameScreen();
  characterMethods.characterMovement(characterSet);
  
  hitBomb();           
             
  scoreCalculator();
  bomb1.bombDisplay();
  bomb1.bombMoveDown();
  bomb1.increaseSpeed(score);
  livesMethods.printLives();
 }
}
        
        
void gameScreen()
{
          if(gameStarted==true)
          {
              background(255);
              PImage backDrop;
              imageMode(CENTER);
              backDrop = loadImage("backdrop.png");
              image(backDrop, width/2, 300, 600,600);
            
            
          }
}

void scoreCalculator()
{
  int add=bomb1.getScoreAdd();
  score+=add;
   text(score,width/2,680); 
}

void hitBomb()
{
  //coordinates of bomb
 int x1=int(bomb1.getXCoord());
 int y1=int(bomb1.getYCoord());
 
 //coordinates of character
 int x2=characterMethods.getXCoord();
 int y2=characterMethods.getYCoord();
 
 int hitRadius=int(dist(x1,y1,x2,y2));
 if (hitRadius<50)
 {
   livesMethods.lostLife(-1);
 }
}

void gameOver()
{
  dead=livesMethods.noLives();
  
  if(dead==true)
  {
    gameStarted=false;
    gameOverScreen();
  }
}

void gameOverScreen()
{
  rectMode(CENTER);
  fill(0,0,200);
  rect(width/2,height/2,400,500); 
  textFont(text);       
  fill(255);
            
              textAlign(CENTER);
              text("GAME OVER",width/2,180); 
              
              noFill();
              text("Quit?",width/2,480); 
              rect(width/2,460,200,70);
              
              text("Try Again?",width/2,380); 
              rect(width/2,360,200,70);
}

//////////////////buttons/////////////////////////////////////////////////////
void startButtonPressed()
{ 
  //this if statement checks to see if the start button has been pressed
            
   if ((mouseX>225)&&(mouseX<375)&&(mouseY<425)&&(mouseY>275)&&(starting==true))
             {
               starting=false;//stop running the startScreen method
               pickCharacterScreenOpen=true;
                
             }
}

void characterOneChosen()
{
  
   if((mouseX>90)&&(mouseX<290)&&(mouseY<500)&&(mouseY>200))
    {
   
              characterSet=true;//means character images will be of character 1
              gameStarted=true;//game will start
              pickCharacterScreenOpen=false;//close pick character screen
      
    }   
}

void characterTwoChosen()
{
   if((mouseX>310)&&(mouseX<510)&&(mouseY<500)&&(mouseY>200))
    {
 
      characterSet=false;//means character images will be of character 2
      gameStarted=true;//game will start
      pickCharacterScreenOpen=false;//close pick character screen

     }       
}

void tryAgainButton()
{
  if(mouseX<400 &&mouseX>200 &&mouseY<395 &&mouseY>325)
  {
  dead=false;
  loading=true;
  }
}

void quitButtonPressed()
{
  if(mouseX<400 &&mouseX>200 &&mouseY<495 &&mouseY>425)
  {
  exit();
  }
}


void mousePressed()
{
      if(dead)
      {
      quitButtonPressed();
      tryAgainButton();
      } text("Quit?",width/2,480); 
      
      if((gameStarted==false)&&(pickCharacterScreenOpen==true))
      {
      characterOneChosen();
      characterTwoChosen();
      }
      startButtonPressed ();
}

void keyPressed()
{
 if (key==CODED&&gameStarted)
  {
      
         //when the right key is pressed
         if(keyCode==RIGHT)
           {
           characterMethods.arrowKeysRight();
         
           }
          //when the left key is pressed
         else if(keyCode==LEFT)
         {
            characterMethods.arrowKeysLeft();
         }
 }

 
}
