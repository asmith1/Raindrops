class Catcher {
  int d;
  int h;
  color c;
  PVector loc;
  Catcher() {
    h = 80;
    loc = new PVector(mouseX, height-h);
    d = 60;
    colorMode(HSB, 360, 100, 100);
    c= color(random(360), 100, 100);
  }
  void display() {
    fill(c);
    ellipse(loc.x, loc.y, d, d);
  }

  void move() {
    loc.set(mouseX, height-h);
  }

  void catchdrop(Raindrops r) {
    if (dist(loc.x, loc.y, r.loc.x, r.loc.y) < d/2+r.d/2) {
      r.loc.set(-width, height);
      score++;
      colorMode(HSB, 360, 100, 100);
      c = color(random(360), 100, 100);
    }
  }
}

