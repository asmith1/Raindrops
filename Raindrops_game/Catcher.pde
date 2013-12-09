class Catcher {
  int d;
  PVector loc;
  Catcher() {
    loc=new PVector(mouseX, height-40);
    d=40;
  }
  void display() {
    ellipse(mouseX, loc.y, d, d);
  }
  void catchdrop(Raindrops r) {
    if (loc.dist(r.loc) < d/2+r.d/2) {
      r.loc.set(-width, height*20);
      println("touch");
    }
  }
}

