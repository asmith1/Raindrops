class Catcher { //creates the class "Catcher"
  PImage bucket;
  int d; //declars the integer variable "d"
  int h; //declares the integer variable "d"
  color c; //declares the color variable "c"
  PVector loc; //declares the PVector variable "loc"
  Catcher() {
    h = 80; //initializes h
    loc = new PVector(mouseX, height-h); //initializes loc
    d = 80; //initializes d
    colorMode(HSB, 360, 100, 100); 
    c= color(random(360), 100, 100); //initializes c
    bucket = loadImage("Bucket.jpg");
  }
  void display() { //creates the method display
  imageMode(CENTER);
  tint(c);
  image(bucket,loc.x,loc.y,d,d);
  
   // fill(c); //fills the circle with a random color, c
   // ellipse(loc.x, loc.y, d, d); //creates a circle on the screen with location "loc" and diameter "d"
  }

  void move() {
    loc.set(mouseX, height-h); //makes the catcher's location values reset every frame so the catcher will move
  }

  void catchdrop(Raindrops r) {
    if (dist(loc.x, loc.y, r.loc.x, r.loc.y) < d/2+r.d/2) { //when the catcher touches a raindrop...
      r.loc.set(-width, height); //the location of the raindrop is put off the screen
      score++; //the score increases by one
      colorMode(HSB, 360, 100, 100);
      c = color(random(360), 100, 100); //the catcher turns a random color
    }
  }
  
  void catchsun(Sunshine s){
   if(dist(loc.x,loc.y,s.loc.x,s.loc.y) < d/2 + s.d/2) {
    s.loc.set(-width,height);
    score=score-3;
    colorMode(HSB,360,100,100);
    c=color(random(360),100,100);
   } 
  }
}

