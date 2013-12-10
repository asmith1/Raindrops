class Catcher {
  int d;
  int h;
  PVector loc;
  Catcher() {
    h = 50;
    loc = new PVector(mouseX, height-h);
    d = 40;
  }
  void display() {
    ellipse(loc.x, loc.y, d, d);
  }
  
  void move(){
   loc.set(mouseX,height-h); 
  }
  
  void catchdrop(Raindrops r) {
    if (dist(loc.x,loc.y,r.loc.x,r.loc.y) < d/2+r.d/2) {
      r.loc.set(-width, height);
      score++;
   
    }
  }
}

