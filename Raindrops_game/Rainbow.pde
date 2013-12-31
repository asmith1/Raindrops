class Rainbow {
  void display(int d) {
    if (d==0) { //happens if the parameter entered is 0
      colorMode(HSB, width, 100, 100); //sets the color mode
      for (int i=0;i<width;i++) {
        stroke(i, 100, 100); //sets the color of each line a different hue in the spectrum
        line(i, 0, i, height); //creates vertical lines covering the entire screen
      }
    }
    if (d==1) { //happens if the parameter entered is 1
      colorMode(HSB, height, 100, 100); //sets the color mode
      for (int j=0; j<height; j++) {
        stroke(j, 100, 100); //sets the color of each line a different hue in the spectrum
        line(0, j, width, j); //creates horrizontal lines covering the entire screen
      }
    }
  }
}
