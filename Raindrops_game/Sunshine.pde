class Sunshine {
  PImage sun; //declares the image variable
  PVector loc; //declares loc
  PVector vel; //declares vel
  int d; //declares d
  Sunshine() {
    sun = loadImage("Sun.jpg"); //loads the image sun
    loc = new PVector(random(width), 0); //initializes loc
    vel = new PVector(0, 4); //initializes vel
    d = 40; //initializes d
  }
  void display() { //creates the method display
    imageMode(CENTER); //makes the image location coordinates line up with the center of the image
    noTint(); //makes the images stay their original color
    image(sun, loc.x, loc.y, d, d); //displays the image at location loc with size d
  }
  void fall() { //creats the method fall
    loc.add(vel); //makes the circles move down the screen
  }
}

