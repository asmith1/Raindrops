class Catcher {
  int d;
  PVector loc;
  Catcher() {
    loc = new PVector(mouseX, height-40);
    d = 40;
  }
  void display() {
    ellipse(loc.x, loc.y, d, d);
  }
  void catchdrop(Raindrops r) {
    if (dist(loc.x,loc.y,r.loc.x,r.loc.y) < d/2+r.d/2) {
      r.loc.set(-width, height*20);
      print("touch ");
    }
  }
}

