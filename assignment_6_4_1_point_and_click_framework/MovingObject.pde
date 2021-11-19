class MovingObject extends GameObject {
//MOVING OBJECTS TO A CERTAIN POINT (TAKES THE POSITION WHEN YOU CLICK SOMEWHERE)
  float x;
  String identifier;
  int y;
  int owidth;
  int oheight;
  float speed = 1;
  PImage ship;
  public MovingObject(String identifier, int x, int y, int owidth, int oheight) {
    super(identifier, x, y, owidth, oheight);
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
  }
  void draw() {
    fill(0);
    ship = loadImage("ship.png");
    translate (10* cos(millis()/500.0),10* sin(millis()/250.0));
    image(ship, x, y, owidth, oheight);
    x = x - 5f;
  }
}
