int oldtimeR;
int curtimeR;
int timeChangeR;
int indexR;
int oldtimeS;
int curtimeS;
int timeChangeS;
int indexS;
int score;
int gametime;
int oldgametime;
int gametimechange;
//int timeint;
Raindrops[] drops;
Sunshine[] suns;
Catcher c;
PImage img;
float size;
boolean b;
PVector loc;
float d;
Rainbow r;
//int curtime;

void setup() {
  size(displayWidth, displayHeight); //sets the display size
  drops = new Raindrops[200]; //assigns a value for the size of the drops array
  suns = new Sunshine[100];
  c= new Catcher(); //initialzes the variable c
  // timeint=500; //initializes timeint

  timeChangeR = 500;
  timeChangeS=1500;

  img=loadImage("Brian.png"); //initalizes img
  imageMode(CENTER); //makes the image values line up with the center of the image
  size=0; //sets the starting size to 0

    for (int i=0;i<drops.length;i++) {
    drops[i]= new Raindrops();
  } //initilizes each item in the drops array
  for (int i=0;i<suns.length;i++) {
    suns[i]=new Sunshine();
  }


  loc=new PVector(width/2, height/2);
  d=200;
  r = new Rainbow();
  // curtime=millis();
gametimechange=60000;

  b=false;
}

void draw() {
  if (b==true) {
    curtimeR=millis();
    curtimeS=millis();
    gametime=millis()-oldgametime;
    background(0); //sets the background of the display to black
    //oldtime=millis();
    if (gametime-oldgametime<gametimechange) {
      c.display(); //makes the method, "display," for the catcher run, meaning the catcher c will display
      c.move(); //makes the method, "move," for the catcher, run, meaning the catcher will move when my mouse moves (and not just stay in the corner the whole time like it previously did)
      if (curtimeR-oldtimeR>timeChangeR) {
        if (indexR<drops.length) {
          indexR++;
        } //makes the index increase by 1 every time the time interval is reached as long as it is less than the length of the drops array
        oldtimeR=curtimeR;
      } //resents the time change to 0
      if (curtimeS-oldtimeS>timeChangeS) {
        if (indexS<suns.length) {
          indexS++;
        } 
        oldtimeS=curtimeS;
      }

      for (int i=0;i<indexR;i++) {
        drops[i].display(); //makes the raindrops display at the top of the screen
        drops[i].fall(); //makes the raindrops fall down the screen
      } //the "display" and "fall" methods run when the index is increased
      for (int i=0;i<indexS;i++) {
        suns[i].display();
        suns[i].fall();
      }

      for (int i=0; i<drops.length; i++) {
        c.catchdrop(drops[i]);
      } //the catchdrop method runs for every raindrop in the Raindrop array, which means the catcher "catches" the raindrop (or moves it to a location far far away)
      for (int i=0; i<suns.length;i++) {
        c.catchsun(suns[i]);
      }

      textAlign(CENTER); //aligns the text so the value for the x coordinate is in the center of the text
      fill(255); //makes the text white
      textSize(50); //sets the text size
      text(score, width/2, 50); //makes the score appear at the top ofthe screen
      loc = new PVector(-width, height);
    }
    else {
      colorMode(RGB, 255, 255, 255);
      fill(255, 255, 255);
      textSize(50);
      if (score>=50) { //makes these things display if the player scored 40 points or more
        image(img, width/2, height/2, size, size); //display the image "Brian"
        size++; //makes "Brian" get bigger
        if (size>=width) {
          size=width;
        } //makes Brian stop growing once he has filled up the width of the screen
        text("Congratulations!\nYou scored " + score + " points!", width/2, height/2);
      } //displays "congratulations! you scored ___ points!" in the center of the screen

      else { //makes this happen if the score is less than 50 points
        if (score==1) {
          // fill(255, 255, 255);
          text("Good try!\nYou scored " + score + " point!", width/2, height/2);
        }
        else {
          //  fill(255, 255, 255);
          text("Good try!\nYou scored " + score + " points!", width/2, height/2);
        } //displays "good try! You scored ___ points!"
      }
      loc = new PVector(300, 250);
      d=150;
      fill(255, 0, 0);
      ellipse(loc.x, loc.y, d, d);
      textSize(20);
      fill(255, 255, 255);
      text("Return to\nStart Screen", 300, 240);
      //curtime=0;
    }
  }
  else { //happens if b is false
    r.display(1);
    stroke(0);
    strokeWeight(2);
    colorMode(RGB, 255, 255, 255);
    fill(20, 198, 27);
    loc = new PVector(width/2, height/2+100);
    d=200;
    ellipse(loc.x, loc.y, d, d);
    textAlign(CENTER);
    fill(0);
    textSize(40);
    text("Start", width/2, height/2+110);
    textSize(60);
    text("Catch the raindops as they fall.\nTry to score 50 points!", width/2, 250);
  }
}
void mousePressed() {
  if (dist(mouseX, mouseY, loc.x, loc.y)<d/2) {
    b=!b; //switches the boolean on or off when the mouse is clicked inside the circle
    gametime=oldgametime;
  }
}

