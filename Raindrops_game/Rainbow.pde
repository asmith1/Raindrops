class Rainbow {
  void display(int d) {
    if (d==0) {
      colorMode(HSB, width, 100, 100);
      for (int i=0;i<width;i++) {
        stroke(i, 100, 100);
        line(i, 0, i, height);
      }
    }
    if (d==1) {
      colorMode(HSB, height, 100, 100);
      for (int j=0; j<height; j++) {
        stroke(j, 100, 100);
        line(0, j, width, j);
      }
    }
  }
}
