int oldtime;
int index;
int score;
Raindrops[] drops;
Catcher c;

void setup() {
  size(displayWidth, displayHeight); //sets the display size
  drops = new Raindrops[100]; //assigns a value for the size of the drops array
  c= new Catcher(); //??????????????????????
  for (int i=0;i<drops.length;i++) {
    drops[i]= new Raindrops();
  } //assigns a value ??????????? to each item in the drops array
}

void draw() {
  background(0); //sets the background of the display to black
  c.display(); //makes the method, "display," for the catcher run, meaning the catcher c will display
  c.move(); //makes the method, "move," for the catcher run, meaning the catcher will move when my mous moves (and not just stay in the corner the whole time like it previously did)
  if (millis()-oldtime>500) {
    if (index<drops.length) {
      index++;
    }
    oldtime=millis();
  } //every 500 miliseconds, the index will increase by one as long as it is less than the length of the drops array
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
  text(score,width/2,50); //makes the score appear at the top ofthe screen
}

