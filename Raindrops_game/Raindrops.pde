class Raindrops {
  PVector loc;
  PVector vel;
  int d;
  Raindrops() {
    loc = new PVector(random(width), 0);
    vel = new PVector(0, 3);
    d = 10;
  }
  void display() {
    ellipse(loc.x, loc.y, d, d);
  }
  void fall() {
    loc.add(vel);
  }
  void reset() {
    if (loc.y>height) {
      loc.y=0;
    }
  }
}


