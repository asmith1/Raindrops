class Raindrops {
  PImage drops;
  PVector loc; //declares loc
  PVector vel; //declares vel
  int d; //declares d
  Raindrops() {
    drops = loadImage("Raindrop.jpg");
    loc = new PVector(random(width), 0); //initializes loc
    vel = new PVector(0, 3); //initializes vel
    d = 40; //initializes d
  }
  void display() { //creates the method display
    imageMode(CENTER);
    noTint();
    image(drops, loc.x, loc.y,d,d);
  }
  void fall() { //creats the method fall
    loc.add(vel); //makes the circles move down the screen
  }
  void reset() { //creates the method reset, which is not used in the sketch, but is included for if the timer is not used
    if (loc.y>height) {
      loc.y=0;
    } //puts the raindrops back at the top of the screen when they reach the bottom
  }
}

