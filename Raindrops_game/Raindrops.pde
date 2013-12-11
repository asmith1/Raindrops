class Raindrops {
  PVector loc; //declares loc
  PVector vel; //declares vel
  int d; //declares d
  Raindrops() {
    loc = new PVector(random(width), 0); //initializes loc
    vel = new PVector(0, 3); //initializes vel
    d = 15; //initializes d
  }
  void display() { //creates the method display
    colorMode(RGB,255,255,255);
    fill(random(23, 30), random(190, 220), random(245, 255)); //fill the raindrops with a random shade of light blue
    ellipse(loc.x, loc.y, d, d); //creates circles that appear at the top of the screen
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

