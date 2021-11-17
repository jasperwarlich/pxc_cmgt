class StoryBox {
  PImage dialog;
  int bX;
  int bY;
  String text;
  int posX = 0;
  int posY = 550;
  int boxSizeX = 1280;
  int boxSizeY = 300;

  StoryBox(PImage pDialog, int pBx, int pBy, String pText) {
    dialog = pDialog;
    bX = pBx;
    bY = pBy;
    text = pText;
  }

  void update() {
    image(dialog, bX, bY);
    if (mouseX > bX && mouseX < (bX + dialog.width) &&
      mouseY > bY && mouseY < (bY + dialog.height)) {
      rectMode(CORNER);
      fill(0);
      rect(mouseX, mouseY, 85, 50, 20);
      fill(255);
      text("Click to open \n the dialog!", mouseX + 10, mouseY +23);
      if (mouseWentDown)
      {
        //We will add images later

        fill(0);
        rect(posX, posY, boxSizeX, boxSizeY);
        fill(255);
        text(text, posX+13, posY+33);
      }
    } else {
      mouseWentDown = false;
    }
  }
}
