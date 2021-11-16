class Scenes {
  PImage currentBackground;
  String backgroundName;
  Scenes(PImage pCurrentBackground, String pBackgroundName) {
    currentBackground = pCurrentBackground;
    backgroundName = pBackgroundName;
  }

  boolean scene1 = true;
  boolean scene2;
  boolean scene3;

  int buttonSize = 50;
  int posX = 50;
  int posY = 50;
  int bt = 2; // delete later
  void update() {
    if (scene1) {
      background(currentBackground);
      scene2 = false;
      scene3 = false;
      rect(posX, posY, buttonSize, buttonSize, bt);
    } else if (scene2) {
      //Add different elements in this scene
      //background(currentBackground);
      scene1 = false;
      scene3 = false;
    } else if (scene3) {
      //Add different elements in this scene
      //background(currentBackground);
      scene1 = false;
      scene2 = false;
    }
    //Working buttons (rect)
    if (overButton(posX, posY, buttonSize, buttonSize) && mousePressed) {
      println("asdsadas00");
      bt = 130;
    } else
    {
      println("12312312312312");
      bt = 2;
    }
  }
  
  boolean overButton(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
}
