class StoryBox extends GameObject {
  String image;
  PImage gameObjectImage;
  int x;
  int y;

  int owidth;
  int oheight;

  boolean dialogShow;

  String[] asd;
  int currentText = 0;

  float nextButtonX = 1169;
  float nextButtonY = 632;
  float nextButtonW = 80;
  float nextButtonH = 50;

  String storyText = "Welcome sailor! I heard you are an adventurer. I have something for you. A map! \n This will lead you to the biggest treasure you have ever seen. But be careful, it is very dagerous!";

  public StoryBox(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.gameObjectImage = loadImage(gameObjectImageFile);
  }

  void draw() {

    image(gameObjectImage, x, y, owidth, oheight);
    if (mouseIsHovering && mouseWentDown)
    {
      dialogShow = true;
    }
    if (dialogShow) {
      fill(0);
      rect(0, 600, 1280, 300);
      fill(255);
      textSize(24);
      text(storyText, 20, 630);
      rect(nextButtonX, nextButtonY, nextButtonW, nextButtonH, 45);
      fill(0);
      textSize(12);
      text("NEXT!", 1192, 660);
    }
    if (mouseX >= nextButtonX && mouseX <= nextButtonX + nextButtonW && mouseY >= nextButtonY && mouseY <= nextButtonY + nextButtonH && mouseWentDown) {
      storyText = "Take the map sailor and go on your adventure!";
    }
    if (storyText == "Take the map sailor and go on your adventure!" && dialogShow)
    {
      fill(255);
      rect(nextButtonX-100, nextButtonY, nextButtonW, nextButtonH, 45);
      fill(0);
      text("Accept!", 1090, 660);
      if (mouseX >= nextButtonX - 100 && mouseX <= nextButtonX - 100 + nextButtonW && mouseY >= nextButtonY && mouseY <= nextButtonY + nextButtonH && mouseWentDown)
      {
        dialogShow = false;
      }
    }
  }
}
