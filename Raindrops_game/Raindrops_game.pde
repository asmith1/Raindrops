int oldtimeR;
int curtimeR;
int timeChangeR;
int indexR;
//these variables are used to determine when the raindrops fall based on time

int oldtimeS;
int curtimeS;
int timeChangeS;
int indexS;
//these variables are used to determine when the suns fall based on time

int score;
//declare score variable

int starttime;
//used to reset the game (but currently doesn't work correctly)

Raindrops[] drops;
Sunshine[] suns;
Catcher c;
Rainbow r;
//declare the class variables

PImage img;
float size;
//used for my picture of Brian at the end

PVector loc;
float d;
//variables to change my start and stop button

boolean b;
//declare my boolean to go from start screen to the game


void setup() {
  size(displayWidth, displayHeight); //sets the display size
  drops = new Raindrops[200]; //assigns a value for the size of the drops array
  suns = new Sunshine[90]; //assigns a value for the size of the suns array
  c= new Catcher(); //initialzes the variable c

  timeChangeR = 500; //sets the time difference that has to occur for a raindrop to fall
  timeChangeS = 1500; //sets the time difference that has to occur for a sun to fall

  img = loadImage("Brian.png"); //initalizes img
  imageMode(CENTER); //makes the image values line up with the center of the image
  size=0; //sets the starting size to 0

    for (int i=0;i<drops.length;i++) {
    drops[i]= new Raindrops();
  } //initilizes each item in the drops array
  for (int i=0;i<suns.length;i++) {
    suns[i]=new Sunshine();
  } //initilizes each item in the suns array

  r = new Rainbow(); //initializes r

  b=false; //sets the boolean to false so the start screen will appear when the program is first openned
}

void draw() {
  if (b==true) {
    curtimeR=millis()-starttime;
    curtimeS=millis()-starttime;
    //sets the current time equal to the time minus the time that the game started

    background(0); //sets the background of the display to black

    if (millis()-starttime<40000) {
      c.display(); //makes the method, "display," for the catcher run, meaning the catcher c will display
      c.move(); //makes the method, "move," for the catcher, run, meaning the catcher will move when my mouse moves (and not just stay in the corner the whole time like it previously did)
      if (curtimeR-oldtimeR>timeChangeR) {
        if (indexR<drops.length) {
          indexR++;
        } //makes the raindrop index increase by 1 every time the time interval is reached as long as it is less than the length of the drops array
        oldtimeR=curtimeR;
      } //resents the time change to 0
      if (curtimeS-oldtimeS>timeChangeS) {
        if (indexS<suns.length) {
          indexS++;
        } //makes the sun index increase by 1 every time the time interval is reached as long as it is less than the length of the sun array
        oldtimeS=curtimeS;
      }//resents the time change to 0

      for (int i=0;i<indexR;i++) {
        drops[i].display(); //makes the raindrops display at the top of the screen
        drops[i].fall(); //makes the raindrops fall down the screen
      } //the "display" and "fall" methods run when the index is increased
      for (int i=0;i<indexS;i++) {
        suns[i].display(); //makes the suns display at the top of the screen
        suns[i].fall(); //makes the suns fall down the screen
      }  //the "display" and "fall" methods run when the index is increased

      for (int i=0; i<drops.length; i++) {
        c.catchdrop(drops[i]);
      } //the catchdrop method runs for every raindrop in the Raindrop array, which means the catcher "catches" the raindrop (or moves it to a location far far away)
      for (int i=0; i<suns.length;i++) {
        c.catchsun(suns[i]);
      } //the catchsun method runs for every sun in the Sunshine array, which means the catcher "catches" the sun (or moves it to a location far far away)

      textAlign(CENTER); //aligns the text so the value for the x coordinate is in the center of the text
      colorMode(RGB, 255, 255, 255); //sets the color mode
      fill(255); //makes the text white
      textSize(50); //sets the text size
      text(score, width/2, 50); //makes the score appear at the top ofthe screen
      loc = new PVector(-width, height); //sets the location of the boolean to off the screen so it can't be clicked during the game
    }
    
    else {
      colorMode(RGB, 255, 255, 255); //sets the color mode
      fill(255); //makes the text white
      textSize(50); //sets the text size
      
      if (score>=50) { //makes these things display if the player scored 50 points or more
        image(img, width/2, height/2, size, size); //display the image "Brian"
        size++; //makes "Brian" get bigger
        
        if (size>=width) {
          size=width;
        } //makes Brian stop growing once he has filled up the width of the screen
        text("Congratulations!\nYou scored " + score + " points!", width/2, height/2);
      } //displays "congratulations! you scored ___ points!" in the center of the screen

      else { //makes this happen if the score is less than 50 points
        if (score==1) {
          text("Good try!\nYou scored " + score + " point!", width/2, height/2);
        }
        
        else {
          text("Good try!\nYou scored " + score + " points!", width/2, height/2);
        } //displays "Good try! You scored ___ points!"
      }
      loc = new PVector(300, 250); //sets the location of the stop button
      d=150; //sets the size of the stop button
      fill(255, 0, 0); //makes the button red
      ellipse(loc.x, loc.y, d, d); //makes the button a circle
      textSize(20); //sets the text size
      fill(255, 255, 255); //makes the text white
      text("Return to\nStart Screen", 300, 240); //displays "Return to start screen" on the button
    }
  }
  
  else { //happens if b is false ~ start screen
    r.display(1); //displays the rainbow background
    stroke(0); //makes the stroke black
    strokeWeight(2); //makes the strokeweight 2
    colorMode(RGB, 255, 255, 255); //sets the colormode
    fill(20, 198, 27); //makes the start button green
    loc = new PVector(width/2, height/2+100); //sets the location of the start button
    d=200; //sets the size of the start button
    ellipse(loc.x, loc.y, d, d); //makes the start button a circle
    textAlign(CENTER); //makes the text location align in the center of the text
    fill(0); //makes the text black
    textSize(40); //sets the text size
    text("Start", width/2, height/2+110); //displays "Start" on the button
    textSize(60); //sets the text size
    text("Catch the raindops to fill up the bucket.\n Avoid the sunshine, which dries up the rain.", width/2, 250); //displays the text above the start button
    text("Score 50 points to win!", width/2, height/2+300); //displays the text below the start button
  }
}
void mousePressed() {
  if (dist(mouseX, mouseY, loc.x, loc.y)<d/2) { //happens if you click the button
    b=!b; //switches the boolean on or off when the mouse is clicked inside the circle
    starttime=millis(); //sets the start time equal to the time when the button is clicked so the game can be reset
    score=0; //sets the score back to zero when a new game is started
  }
}

