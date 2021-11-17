class Moving {
//MOVING OBJECTS TO A CERTAIN POINT (TAKES THE POSITION WHEN YOU CLICK SOMEWHERE)
  float posX;
  float posY;
  float mousePosX;
  float mousePosY;
  int size = 50;
  float speed = .03f;
  void update() {
    fill(0);
    posX = lerp(posX, mousePosX, speed);
    posY = lerp(posY, mousePosY, speed);
    if (mousePressed) {
      mousePosX = mouseX;
      mousePosY = mouseY;
    }
    rect(posX, posY, size, size);
  }
}
