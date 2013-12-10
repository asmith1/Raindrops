class Raindrops {
  PVector loc;
  PVector vel;
  int d;
  Raindrops() {
    loc = new PVector(random(width), 0);
    vel = new PVector(0, 3);
    d = 15;
  }
  void display() {
    colorMode(RGB,255,255,255);
    fill(random(23, 30), random(190, 220), random(245, 255));
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

