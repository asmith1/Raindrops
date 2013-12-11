int oldtime;
int index;
int score;
int timeint;
Raindrops[] drops;
Catcher c;
PImage img;
float size;

void setup() {
  size(displayWidth, displayHeight); //sets the display size
  drops = new Raindrops[200]; //assigns a value for the size of the drops array
  c= new Catcher(); //initialzes the variable c
  timeint=500; //initializes timeint
  img=loadImage("Brian.png"); //initalizes img
  imageMode(CENTER); //makes the image values line up with the center of the image
  size=0; //sets the starting size to 0
  for (int i=0;i<drops.length;i++) {
    drops[i]= new Raindrops();
  } //initilizes each item in the drops array
}

void draw() {
  background(0); //sets the background of the display to black
  if (millis()<30000) {
    c.display(); //makes the method, "display," for the catcher run, meaning the catcher c will display
    c.move(); //makes the method, "move," for the catcher, run, meaning the catcher will move when my mouse moves (and not just stay in the corner the whole time like it previously did)
    if (millis()-oldtime>timeint) {
      if (index<drops.length) {
        index++;
      } //makes the index increase by 1 every time the time interval is reached as long as it is less than the length of the drops array
      oldtime=millis();
    } //resents the time change to 0
    for (int i=0;i<index;i++) {
      drops[i].display(); //makes the raindrops display at the top of the screen
      drops[i].fall(); //makes the raindrops fall down the screen
    } //the "display" and "fall" methods run when the index is increased?????????????
    for (int i=0; i<drops.length; i++) {
      c.catchdrop(drops[i]);
    } //the catchdrop method runs for every raindrop in the Raindrop array, which means the catcher "catches" the raindrop (or moves it to a location far far away)
    textAlign(CENTER); //aligns the text so the value for the x coordinate is in the center of the text
    fill(255); //makes the text white
    textSize(50); //sets the text size
    text(score, width/2, 50); //makes the score appear at the top ofthe screen
  }
  else if (millis()>30000) {
    if (score>=40) { //makes these things display if the player scored 40 points or more
      image(img, width/2, height/2, size, size); //display the image "Brian"
      size++; //makes "Brian" get bigger
      if (size>=width) {
        size=width;
      } //makes Brian stop growing once he has filled up the width of the screen
      text("Congratulations!\nYou scored " + score + " points!", width/2, height/2);
    } //displays "congratulations! you scored ___ points!" in the center of the screen

    else { //makes this happen i the score is less than 40 points
      if (score==1) {
        text("Good try!\nYou scored " + score + " point!", width/2, height/2);
      }
      else {
        text("Good try!\nYou scored " + score + " points!", width/2, height/2);
      } //displays "good try! You scored ___ points!"
    }
  }
}

