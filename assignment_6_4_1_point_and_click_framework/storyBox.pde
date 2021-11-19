class StoryBox extends GameObject {
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

  String identifier;

  //ANSWER 1
  int bAnswerX = 700;
  int bAnswerY = 600;
  int bAnswerW = 400;
  int bAnswerH = 30;
  boolean answerOpen = true;


  public StoryBox(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, String[] text ) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.identifier = identifier;
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
    if (i >= textT.length - 1 && answerOpen)
    {
      fill(255);
      rect(bAnswerX, bAnswerY, bAnswerW, bAnswerH, 45);
      fill(0);
      text("No please, continue gold you said?", 710, 620);  

      fill(255);
      rect(bAnswerX, bAnswerY + 40, bAnswerW, bAnswerH, 45);
      fill(0);
      text("What do you know about, out there on the sea?", 710, 660); 

      fill(255);
      rect(bAnswerX, bAnswerY + 80, bAnswerW, bAnswerH, 45);
      fill(0);
      text("I don’t listen to the rumblings of a drunk fool.", 710, 700);
    }
    switch(currentText) {
    case 1:
      textT[i] = "Yesh *hick* real fucking gold. I ish… I *hick* got a map. A map to the treashure *hick*";
      answerOpen = false;
      break;
    case 2:
      textT[i] = "I ish… know the seash, *hick* Shpend a long timesh in the dreaded waves.  But me ship went down you see *hick*. \n Eaten by the bloody sea. Goldsh shti0ll on it. *Hick* Tucked away in chest. But I remembersh… \n *Hick* I always remembersh… where the ship wen down you seesh";
      answerOpen = false;
      break;
    case 3:
      textT[i] = "Arrgh, but you better lishten. *Hick* I was once likesh you… Unlessh you wantsh to end up like me. *Hick";
      answerOpen = false;
      break;
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
