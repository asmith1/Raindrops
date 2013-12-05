int oldtime;
int index;
Raindrops[] drop= new Raindrops[300];
void setup() {
  size(500, 500);
  for (int i=0;i<drop.length;i++) {
    drop[i]= new Raindrops();
  }
}

void draw() {
  background(0);
  for (int i=0;i<index;i++) {
    drop[i].display();
    drop[i].fall();
  } 

  if (millis()-oldtime>1000) {
    if (index<drop.length) {
      index++;
    }
    oldtime=millis();
  }
}

