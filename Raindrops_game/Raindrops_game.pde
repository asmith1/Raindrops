int oldtime;
int index;
Raindrops[] drops = new Raindrops[300];
Catcher c;

void setup() {
  size(500, 500);
  for (int i=0;i<drops.length;i++) {
    drops[i]= new Raindrops();
    c= new Catcher();
  }
}

void draw() {
  background(0);
  c.display();
  for (int i=0;i<index;i++) {
    drops[i].display();
    drops[i].fall();
  }
  for (int i=0; i<drops.length; i++) {
    c.catchdrop(drops[i]);
  } 
  if (millis()-oldtime>500) {
    if (index<drops.length) {
      index++;
    }
    oldtime=millis();
  }
}

