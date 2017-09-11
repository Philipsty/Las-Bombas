//Tyler Philips
//Las_Bombas
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




//creating objects
CharacterClass characterMethods;
Lives livesMethods;
Bombs bomb1;
Bombs bomb2;
Bombs bomb3;
Bombs bomb4;
Bombs bomb5;
 

void setup()
{
 size(600,700); 
 smooth();
 frameRate(120);
 
 //setting variables to initial value
 loadBarx=120;
 //these are boolean variables that will be used to run methods in a certain order
 loading=true;
 starting=false;
 pickCharacterScreenOpen=false;
 gameStarted=false;
 dead=false;
 quitting=false;
 //this is used to set theamount of bombs in a row and the score to its starting value
 score=0;
 
 
 //setting random locations for the different bomb objects
 float randNumber = int(random(5)); 
 bomb1 = new Bombs((100*randNumber)+50, -60,  10);
 randNumber = int(random(5));
 bomb2 = new Bombs((100*randNumber)+50, -60,  10);
 randNumber = int(random(5));
 bomb3 = new Bombs((100*randNumber)+50, -60,  10);
 randNumber = int(random(5));
 bomb4 = new Bombs((100*randNumber)+50, -60,  10);
 randNumber = int(random(5));
 bomb5 = new Bombs((100*randNumber)+50, -60,  10);
 randNumber = int(random(5));
  bomb2 = new Bombs((100*randNumber)+50, -60,  10);
  
 livesMethods=new Lives(3);
 characterMethods=new CharacterClass(300,540);


   
}

void draw()
{
  
  
  checkLoad();//checks loading flag
  checkStart();//checks starting flag
  checkCharacterPick();//checks pickCharacterOpen flag
  checkGame();//checks gameStarted flag
  gameOver();//checks dead flag


}

void checkLoad()
//this method checks to see if the loading variable is true, if it is it will run a method that will display the loading screen
{
if (loading==true)
{
loadingScreen(); //call loading screen method
}
              
              
}
  
void loadingScreen()
 //this method displays a  loading screen with a loading bar. it will close once the bar is full
{
         
            
               background(#FF6105); 
               
               //this draws a box where a loading bar will be shown
               rectMode(CENTER);
               fill(0);
               stroke(255);
               strokeWeight(5);
               rect(width/2,height/2,400,200);
               
              //this draws the loading bar and increases its length
               loadBarx+=5;
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
                println(dead);
                loading=false;
                starting=true;
              }
  
}
      
      
    
void checkStart()
//this method checks to see if the starting variable is true, if it is it will run a method that will display the starting screen
{
 if (starting==true)
 {
  startScreen();//call start screen
 }
                    
}
        
                
  
void startScreen()
//this method creates the start screen , it will have a start button so the 
 //user can begin the game when they choose. There will also be instructions displayed .
{
               background(#54BC00); 
                
          
 
              //this group of code will print an image of a button labeled start//////////////
              PImage button;
              PImage title;
              imageMode(CENTER);
              button = loadImage("startbutton.png");
              image(button, width/2, 350, 150,150);
              
              //display title image
              title = loadImage("title.png");
              image(title, width/2, 160, 400,200);
              
               
              //this group of code will print out instructions on playing the game /////////////
              textFont(text);       
              fill(255);
              textAlign(CENTER);
              
              //prints instructions on how to play the game
              text= createFont("LAS BOMBAS FONT",15,true); 
              text("Instructions\n--------------\nUse the LEFT and Right arrow keys\n to move your character and avoid bombs!\nFor every row of bombs dodged, 10 points \nwill be added to your score ",width/2,560); 
              
                            
}
        

void checkCharacterPick()
//this method checks to see if the pickCharacterScreenOpen variable is true, if it is it will run a method that will display the screen where user picks the character
{
 if (pickCharacterScreenOpen==true)
 {
   
 pickCharacterScreen();                
 }                                                            
}
        
void pickCharacterScreen()
//this method will display two buttons, each with a different character.There will be a title saying "PICK YOUR CHARACTER"
{

        background(200,0,0); 
        pickCharacterBackDrop();  
      
        text = createFont("LAS BOMBAS FONT",40,true); 
        textFont(text);       
        fill(255);
            
        textAlign(CENTER);
        text("PICK YOUR CHARACTER",width/2,140); 
        
        rectMode(CENTER);
        
        //character button 1////////////////
        fill(255);
        
        if((mouseX>90)&&(mouseX<290)&&(mouseY<500)&&(mouseY>200))//highlights left button
        {
          fill(#EDFF03);
        }
        
        //draw a rectangle for the first button
        stroke(0);
        strokeWeight(4);
        rect(190,350,200,300);
        
        //print image on first button
        PImage finnImage;
        imageMode(CENTER);
        finnImage = loadImage("standing finn right.png");
        image(finnImage, 190,350,190,220);
        text("FINN",190,550); 

        
        
        //character button 2////////////////
        fill(255);
        if((mouseX>310)&&(mouseX<510)&&(mouseY<500)&&(mouseY>200))//highlights right button
        {
                   fill(#EDFF03);
        }
         
         //draws second button
        stroke(0);
        rect(410,350,200,300);
        
        //displays image on second button
        PImage psyImage;
        imageMode(CENTER);
        psyImage = loadImage("psy1.png");
        image(psyImage, 410, 350, 250,250);
         text("PSY",410,550);  
            
  }


void pickCharacterBackDrop()
// create a spiral background
{
  
      background(200,0,0); 
      
      int x2=10;
      int change=10;
      int y2=10;
      ellipseMode(CENTER);
      
      while(y2<=1000)//increase size of circles and prints the circles until the size is 1001
      {
         //set color stroke and fill
        stroke(#FF721A);
        strokeWeight(2);
        noFill();
        
        ellipse(width/2,height/2,x2,y2);//print circle
        //increase size
        x2=x2+change;
        y2=y2+change;
               
      }
}



void checkGame()
//this method will see if the boolean variable gameStarted is true and then run the methods that will be used when the game starts
{
 if(gameStarted==true)
 {
   
  
  gameScreen();//display game screen
  characterMethods.characterMovement(characterSet);//display character
  
  hitBomb();           
  bombsRow();
  //methods to print score and lives
  getScore();//get the score value from bomb class
  printScore();//display score
  livesMethods.printLives();//display lives
 }
}

void gameScreen()
{

  background(255);
              
  PImage backDrop;
  PImage bottomBar;
  imageMode(CENTER);
               
  //display image at bottom of screen where the score and lives vwill be shown
  bottomBar = loadImage("bottom.png");
  image(bottomBar, width/2, 650, 880,330);
               
  //print background image
  backDrop = loadImage("backdrop.png");
  image(backDrop, width/2, 300, 600,600);                      
}
        
void bombsRow()
//call the methods from the bomb class and display another bomb to the row for every hundred points
{
  int speed=bomb1.bombOneSpeed();//sets variable to bomb1 speed so that the other bombs can send it to the sync speeds method so all bombs will have same speed
  bomb1.bombDisplay();
  bomb1.bombMoveDown( );
  
 
 if (score>=100)//when score is 100 add another bomb
 {
  
  bomb2.syncSpeeds(speed);
  bomb2.bombDisplay();
  bomb2.bombMoveDown( );

 }
  if (score>=200)//when score is 200 add another bomb
 {

  bomb3.syncSpeeds(speed); 
  bomb3.bombDisplay();
  bomb3.bombMoveDown( );
 
 }
  if (score>=300)//when score is 300 add another bomb
 {
  bomb4.syncSpeeds(speed);
  bomb4.bombDisplay();
  bomb4.bombMoveDown();
 }
  if (score>=400)//when score is 400 add another bomb
 {

  bomb5.syncSpeeds(speed);  
  bomb5.bombDisplay();
  bomb5.bombMoveDown(  );
 }
 
  
}

void getScore()
{
  score=bomb1.scoreCalculator ();
}
void printScore()
{
  //setting the text size and font
  text = createFont("LAS BOMBAS FONT",20,true); 
  textFont(text);                        
  fill(0);          
  textAlign(CENTER);
  
  //printing score
  text("SCORE:  "+score,400,650); 
}


void hitBomb() 
//this method calculates the distance of the character to each bomb. if the character is in the hit 
//radius it will call methods so that a a life will be lost and the character will be pushed away
{
  //coordinates of bomb1
 int x1=int(bomb1.getXCoord());
 int y1=int(bomb1.getYCoord());
 
 //coordinates of character
 int x2=characterMethods.getXCoord();
 int y2=characterMethods.getYCoord();
 
 //calculating the distance between character and bomb
 int hitRadius=int(dist(x1,y1,x2,y2));
 
 if (hitRadius<70)//within 70 spaces
 {
   characterMethods.recoil();//push character away
   livesMethods.lostLife(-1);//take away a life
 }
 

 if (score>=100)
 {
    //coordinates of bomb
   x1=int(bomb2.getXCoord());
   y1=int(bomb2.getYCoord());
   
   //calculating the distance between character and bomb
   hitRadius=int(dist(x1,y1,x2,y2));
   
   if (hitRadius<70)
   {
     characterMethods.recoil();//push character away
   livesMethods.lostLife(-1);//take away a life
   }
   
 }
  if (score>=200)
 {
   //get coordinates of the bomb
   x1=int(bomb3.getXCoord());
   y1=int(bomb3.getYCoord());
   
    //calculating the distance between character and bomb
   hitRadius=int(dist(x1,y1,x2,y2));
   
   if (hitRadius<70)
   {
     characterMethods.recoil();//push character away
     livesMethods.lostLife(-1);//take away a life
   }
   
 
 }
 
 if (score>=300)
 {
      //get coordinates of the bomb
   x1=int(bomb4.getXCoord());
   y1=int(bomb4.getYCoord());
   
    //calculating the distance between character and bomb
   hitRadius=int(dist(x1,y1,x2,y2));
   
   if (hitRadius<70)
   {
     characterMethods.recoil();//push character away
     livesMethods.lostLife(-1);//take away a life
   }
 }
 if (score>=400)
 {
   //get coordinates of the bomb
   x1=int(bomb5.getXCoord());
   y1=int(bomb5.getYCoord());
   
   //calculating the distance between character and bomb
   hitRadius=int(dist(x1,y1,x2,y2));
   
   if (hitRadius<70)
   {
     characterMethods.recoil();//push character away
     livesMethods.lostLife(-1);//take away a life
   }
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
  fill(#33D1A0);
  rect(width/2,height/2,400,550); 
  text = createFont("LAS BOMBAS FONT",40,true); 
  textFont(text);                        
  fill(0);
  
  PImage gameOverbuttons;
  imageMode(CENTER);

            
                textAlign(CENTER);
              text("GAME OVER",width/2,180); 
              
              text("Your Score: "+score,width/2,280); 
              
              gameOverbuttons = loadImage("quit.png");
              image(gameOverbuttons, width/2,460,300,240);
              text("Quit?",width/2,480); 
               
              
              gameOverbuttons = loadImage("tryagain.png");
              image(gameOverbuttons, width/2,360,300,240);
              text("Try Again?",width/2,380); 
               
}

//////////////////buttons/////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
void startButtonPressed()
//this button runs during the start screen and when pressed, it will cause the pick character screen to open.
{ 
  //this if statement checks to see if the start button has been pressed          
   if ((mouseX>225)&&(mouseX<375)&&(mouseY<425)&&(mouseY>275)&&(starting==true))
             {
               starting=false;//stop running the startScreen method
               pickCharacterScreenOpen=true;//start runnning the pickCharacterScreen method
                
             }
}

void characterOneChosen()
//this method creates a button for the first character on the character pick screen 
{
  
   if((mouseX>90)&&(mouseX<290)&&(mouseY<500)&&(mouseY>200))
    {
   
              characterSet=true;//means character images will be of character 1
              gameStarted=true;//game will start
              pickCharacterScreenOpen=false;//close pick character screen
      
    }   
}

void characterTwoChosen()
//this method creates a button for the second character on the character pick screen 
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
    
//  dead=false;
//  loading=true;
//livesMethods.lostLife(3);
setup();
  
  
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
      }  
      
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