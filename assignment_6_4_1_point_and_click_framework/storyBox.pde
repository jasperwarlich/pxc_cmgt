class StoryBox extends GameObject {
  String image;
  int x;
  int y;
  String text;
  int posX = 0;
  int posY = 550;
  int boxSizeX = owidth;
  int boxSizeY = oheight;

  boolean dialogShow;
  boolean pressed;
  float nextButtonX = 1169;
  float nextButtonY = 632;
  float nextButtonW = 80;
  float nextButtonH = 50;

  String storyText = "blablbablalbalba";


  public StoryBox(String identifier, int x, int y, int owidth, int oheight, String image) {
    super(identifier, x, y, owidth, oheight, image);
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.image = image;
  }

  void draw() {
    //println(mouseIsHovering);
    //println(dialogShow);
    if (mouseIsHovering && mousePressed)
    {
      dialogShow = true;
    }
    if (dialogShow) {
      fill(0);
      rect(0, 600, 1280, 300);
      fill(255);
      text(storyText, 20, 620);
      rect(nextButtonX, nextButtonY, nextButtonW, nextButtonH, 45);
      fill(0);
      text("NEXT!", 1192, 660);
    }
    if (mouseX >= nextButtonX && mouseX <= nextButtonX + nextButtonW && mouseY >= nextButtonY && mouseY <= nextButtonY + nextButtonH && mousePressed) {
      storyText = "34343434343";
    }
  }
}
