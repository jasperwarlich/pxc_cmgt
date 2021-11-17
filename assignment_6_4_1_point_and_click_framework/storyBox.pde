class StoryBox {
  PImage dialog;
  int bX;
  int bY;

  StoryBox(PImage pDialog, int pBx, int pBy) {
    dialog = pDialog;
    bX = pBx;
    bY = pBy;
  }

  void update() {
    image(dialog, bX, bY);
    if (mouseX > bX && mouseX < (bX + dialog.width) &&
      mouseY > bY && mouseY < (bY + dialog.height)) {
      if (mouseWentDown)
      {
        //We will add images later
        int posX = 0;
        int posY = 648;
        int boxSizeX = 800;
        int boxSizeY = 153;
        fill(0);
        rect(posX, posY, boxSizeX, boxSizeY);
        fill(255);
        text("THE STORY BLA BLA", posX+13, posY+33);
      }
    } else {
      mouseWentDown = false;
    }
  }
}
