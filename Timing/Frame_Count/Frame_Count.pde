color c;

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  c=color(random(360), 100, 100);
}

void draw() {
  background(c);
  if (frameCount%200==0) {
    c=color(random(360), 100,   100);
  }
}

