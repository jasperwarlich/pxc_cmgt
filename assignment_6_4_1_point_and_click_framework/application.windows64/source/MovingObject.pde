class MovingObject extends GameObject {
//MOVING OBJECTS TO A CERTAIN POINT (TAKES THE POSITION WHEN YOU CLICK SOMEWHERE)
  float x;
  String identifier;
  float y;
  float mousePosX;
  float mousePosY;
  int owidth;
  int oheight;
  float speed = .01f;
  
  public MovingObject(String identifier, int x, int y, int owidth, int oheight) {
    super(identifier, x, y, owidth, oheight);
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
  }
  
  void draw() {
    fill(0);
    x = lerp(x, mousePosX, speed);
    y = lerp(y, mousePosY, speed);
    if (mousePressed) {
      mousePosX = mouseX;
      mousePosY = mouseY;
    }
    rect(x, y, owidth, oheight);
  }
}
