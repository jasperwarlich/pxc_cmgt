class GameObject {
  protected int x;
  protected int y;
  protected int owidth;
  protected int oheight;
  private String identifier;
  public boolean hasImage;
  private boolean hasHoverImage;
  private PImage gameObjectImage;
  private PImage gameObjectImageHover;
  protected boolean mouseIsHovering;
  boolean hand = false;

  public GameObject(String identifier, int x, int y, int owidth, int oheight) {
    this(identifier, x, y, owidth, oheight, "");
  }

  public GameObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile) {
    this.identifier = identifier;
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.hasImage = !gameObjectImageFile.equals(""); 
    if (this.hasImage) {
      this.gameObjectImage = loadImage(gameObjectImageFile);
    }
    hasHoverImage = false;
    mouseIsHovering = false;
  }

  public void setHoverImage(String gameObjectImageHoverFile) {
    this.gameObjectImageHover = loadImage(gameObjectImageHoverFile);
    hasHoverImage = true;
  }

  public void draw() {
    if (hasImage) {
      if (mouseIsHovering && hasHoverImage) {
        image(gameObjectImageHover, x, y, owidth, oheight);
      } else {
        image(gameObjectImage, x, y, owidth, oheight);
      }
    }
  
  //  if(mouseIsHovering) {
  //    cursor(HAND);
  //    hand = true;
  //  } else {
  //    cursor(ARROW);
  //    hand = false;
  //  }
  //   if(hand == true) {
  //     cursor(HAND);
  //} else {
  //  cursor(ARROW);

  //}
}



//  if (mouseIsHovering) {
//    rectMode(CORNER);
//    fill(0);
//    rect(mouseX, mouseY, 85, 50, 20);
//    fill(255);
//    text("Go further!", mouseX + 10, mouseY +23);
//    cursor(HAND);
//  } else if(!mouseIsHovering) {
//    cursor(ARROW);
//  }
//}

public void mouseMoved() {
  mouseIsHovering = false;
  if (mouseX >= x && mouseX <= x + owidth &&
    mouseY >= y && mouseY <= y + oheight) {
    mouseIsHovering = true;
  }
}

public void mouseClicked() {
}

public String getIdentifier() {
  return this.identifier;
}

@Override 
  public boolean equals(Object obj) { 
  if (obj == this) { 
    return true;
  } 
  if (obj == null || obj.getClass() != this.getClass()) { 
    return false;
  } 
  GameObject otherGameObject = (GameObject) obj; 
  return otherGameObject.getIdentifier().equals(this.identifier);
} 

@Override 
  public int hashCode() { 
  final int prime = 11;
  return prime * this.identifier.hashCode();
}
}
