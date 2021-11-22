class FirstDialog extends GameObject {
  String image;
  PImage gameObjectImage;
  int x;
  int y;
  int posX = 0;
  int posY = 550;

  int rectY;
  int i = 0;

  int b = 0;

  int owidth;
  int oheight;

  boolean dialogShow = true;

  String[] asd;
  int currentText = 0;

  float nextButtonX = 1169;
  float nextButtonY = 632;
  float nextButtonW = 80;
  float nextButtonH = 50;
  String storyText;
  public String[] textT;
  PImage gameObjectImageFile;

  String identifier;

  //ANSWER 1
  int bAnswerX = 700;
  int bAnswerY = 600;
  int bAnswerW = 400;
  int bAnswerH = 30;
  boolean answerOpen = true;


  public FirstDialog(String identifier, int x, int y, int owidth, int oheight, String[] text ) {
    super(identifier, x, y, owidth, oheight);
    this.identifier = identifier;
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.textT = text;
  }

  void draw() {

    if (dialogShow == true) {
      if (i == textT.length) {
        dialogShow = false;
        i = 0;
        currentText = 0;
      } else {
        textSize(20);
        storyText = getText(i);
        rectY= 590;
        fill(0);
        rect(0, rectY, 1280, 300);
        fill(255);
        text(storyText, 20, 620);
        if (i < textT.length) {
          drawNext();
        } else if (i == (textT.length - 1)) {
          rect(nextButtonX, nextButtonY, nextButtonW, nextButtonH, 45);
          fill(255);
          textSize(16);
          text("CLOSE", 1192, 660);
        }
      }
    }
    
    if(dialogShow == false && identifier != "dialog2") {
      fill(0);
      rect(855,25,400,100,28);
      fill(255);
      textSize(32);
      text("Find the missing parts", 870, 80);
    }

  }

  String getText(int i) {
    return textT[i];
  }

  void mouseClicked() {
    if (mouseX >= nextButtonX && mouseX <= nextButtonX + nextButtonW && mouseY >= nextButtonY && mouseY <= nextButtonY + nextButtonH && (i < textT.length)) {
      i++;
    }
    if (mouseX >= bAnswerX && mouseX <= bAnswerX + bAnswerW && mouseY >= bAnswerY && mouseY <= bAnswerY + bAnswerH)
    {
      currentText = 1;
    } if (mouseX >= bAnswerX && mouseX <= bAnswerX + bAnswerW && mouseY >= bAnswerY + 40 && mouseY <= bAnswerY + 40 + bAnswerH) {
      currentText = 2;
    }  if (mouseX >= bAnswerX && mouseX <= bAnswerX + bAnswerW && mouseY >= bAnswerY + 80 && mouseY <= bAnswerY + 80 + bAnswerH) {
      currentText = 3;
    }
  }

  void drawNext() {
    rect(nextButtonX, nextButtonY, nextButtonW, nextButtonH, 45);
    fill(0);
    textSize(16);
    text("NEXT!", 1192, 660);
  }
}
