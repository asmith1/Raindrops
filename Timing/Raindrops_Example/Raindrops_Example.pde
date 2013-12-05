
int index;
Raindrops[] drop= new Raindrops[30];
void setup() {
  size(500, 500);
  for (int i=0;i<30;i++) {
    drop[i]= new Raindrops();
  }
}

void draw() {
  for (int i=0;i<index;i++) {
    drop[i].display();
    drop[i].fall();
  } 
  if (index<drops[i].length) {
    index++;
  }
}

