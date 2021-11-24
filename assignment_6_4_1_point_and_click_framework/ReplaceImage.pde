class ReplaceImage {
  PImage image;
  int x;
  int y;
  int owidth;
  int oheight;
  
  public ReplaceImage(PImage image, int x, int y, int owidth, int oheight) {
    this.image = image;
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight= oheight;
  }
  
  public void draw() {
    image(image,x,y,owidth,oheight);
  }
}
