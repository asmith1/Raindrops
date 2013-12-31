class Catcher { //creates the class "Catcher"
  PImage bucket; //declares the image variable
  int d; //declars the integer variable "d"
  int h; //declares the integer variable "d"
  color c; //declares the color variable "c"
  PVector loc; //declares the PVector variable "loc"
  Catcher() {
    h = 80; //initializes h
    loc = new PVector(mouseX, height-h); //initializes loc
    d = 80; //initializes d
    colorMode(HSB, 360, 100, 100); //sets the color mode
    c= color(random(360), 100, 100); //initializes c
    bucket = loadImage("Bucket.jpg"); //loads the picture of a bucket
  }
  void display() { //creates the method display
  imageMode(CENTER); //maked the image line up with the location coordinates at the center of the image
  tint(c); //makes the bucket the color c
  image(bucket,loc.x,loc.y,d,d); //displays the image
  }

  void move() {
    loc.set(mouseX, height-h); //makes the catcher's location values reset every frame so the catcher will move
  }

  void catchdrop(Raindrops r) {
    if (dist(loc.x, loc.y, r.loc.x, r.loc.y) < d/2+r.d/2) { //when the catcher touches a raindrop...
      r.loc.set(-width, height); //the location of the raindrop is put off the screen
      score++; //the score increases by one
      colorMode(HSB, 360, 100, 100); //sets the colormode
      c = color(random(360), 100, 100); //the catcher turns a random color
    }
  }
  
  void catchsun(Sunshine s){ 
   if(dist(loc.x,loc.y,s.loc.x,s.loc.y) < d/2 + s.d/2) { //happens when the catcher touches a sun
    s.loc.set(-width,height);  //the location of the raindrop is put off the screen
    score=score-3; //score decrreases by 3
    colorMode(HSB,360,100,100); //sets the colormode
    c=color(random(360),100,100); //makes the catcher turn a random color
   } 
  }
}

