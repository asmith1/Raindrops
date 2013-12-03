int oldTime;
color c;
void setup(){
  size(300,200);
  colorMode(HSB,360,100,100);
  c=color(random(360),100,100);
}
void draw(){
  background(c);
  if(millis()-oldTime>2000){
   c=color(random(360),100,100);
  oldTime=millis(); 
  }
  textAlign(CENTER);
  textSize(70);
  fill(0);
  text(millis()/1000,width/2,height/2);
}
