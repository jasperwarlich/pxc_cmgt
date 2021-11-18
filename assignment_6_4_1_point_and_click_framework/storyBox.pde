class StoryBox extends GameObject {
  String image;
  PImage gameObjectImage;
  int x;
  int y;
  int posX = 0;
  int posY = 550;
  
  int rectY;
  int i = 0;


  int owidth;
  int oheight;

  boolean dialogShow;

  String[] asd;
  int currentText = 0;

  float nextButtonX = 1169;
  float nextButtonY = 632;
  float nextButtonW = 80;
  float nextButtonH = 50;
  String storyText;
  public String[] textT;
  PImage gameObjectImageFile;

  

  public StoryBox(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, String[] text ) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.gameObjectImageFile = loadImage(gameObjectImageFile);
    this.textT = text;
  }



  void draw() {

    image(gameObjectImageFile, x, y, owidth, oheight);
    if (mouseIsHovering && mouseWentDown)
    {
      dialogShow = true;
      
    }

    if(dialogShow == true) {
        if (i == textT.length) {
          dialogShow = false;
          i = 0;
        } else {
          storyText = getText(i);
          println(i);
          rectY= 600;
          fill(0);
          rect(0, rectY, 1280, 300);
          fill(255);
          text(storyText, 20, 620);
          if(i < textT.length) {
            drawNext();
          } else if (i == (textT.length - 1)) {
            rect(nextButtonX, nextButtonY, nextButtonW, nextButtonH, 45);
            fill(0);
            text("CLOSE", 1192, 660);
          }            
    }
    }
  }
    
  

 
  
  String getText(int i) {
    return textT[i];
  }
  
  void mouseClicked() {
    if(mouseX >= nextButtonX && mouseX <= nextButtonX + nextButtonW && mouseY >= nextButtonY && mouseY <= nextButtonY + nextButtonH && (i < textT.length)) {
          i++;
    }
  }
  
  void drawNext() {
    rect(nextButtonX, nextButtonY, nextButtonW, nextButtonH, 45);
    fill(0);
    text("NEXT!", 1192, 660);
  }
}
