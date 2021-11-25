import processing.sound.*;
class Player extends GameObject {

  float x;
  String identifier;
  int y;
  int owidth;
  int oheight;
  float speed = 8;
  PImage gameObjectImageFile;
  
  public Player(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile) {
    super(identifier, x, y, owidth, oheight);
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.gameObjectImageFile = loadImage(gameObjectImageFile);
  }
  void draw() {
    image(gameObjectImageFile, x, y, owidth, oheight);

    if (x<= 100f)
    {
      speed *= .99f;
      x+= speed;    
      
    }
  }
}
