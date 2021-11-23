class MovingObject extends GameObject {
//MOVING OBJECTS TO A CERTAIN POINT (TAKES THE POSITION WHEN YOU CLICK SOMEWHERE)
  float x;
  String identifier;
  int y;
  int owidth;
  int oheight;
  float speed = .2;
  float speedY = .2;
  PImage gameObjectImageFile;
  public MovingObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile) {
    super(identifier, x, y, owidth, oheight);
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.gameObjectImageFile = loadImage(gameObjectImageFile);
  }
  void draw() {
    image(gameObjectImageFile, x, y, owidth, oheight);
    x += speed;
    //y += speedY;
    println(speedY);
    if(x > 7 || x < 0){
     speed *= -1f;
    }
   
    println(y);
  }
}
