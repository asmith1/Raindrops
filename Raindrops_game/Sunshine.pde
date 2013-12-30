class Sunshine {
  PImage sun;
  PVector loc; //declares loc
  PVector vel; //declares vel
  int d; //declares d
  Sunshine() {
    sun = loadImage("Sun.jpg");
    loc = new PVector(random(width), 0); //initializes loc
    vel = new PVector(0, 4); //initializes vel
    d = 40; //initializes d
  }
  void display() { //creates the method display
    imageMode(CENTER);
    noTint();
    image(sun, loc.x, loc.y, d, d);
  }
  void fall() { //creats the method fall
    loc.add(vel); //makes the circles move down the screen
  }
}

