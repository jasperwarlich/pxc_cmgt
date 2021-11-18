class CollectableObject extends GameObject { 
  private Collectable collectable;
  private GameObject replaceWith;
  private boolean willReplaceByAnotherGameObject;

  public CollectableObject(String identifier, int x, int y, int owidth, 
    int oheight, Collectable collectable) {
    this(identifier, x, y, owidth, oheight, collectable, null);
  }

  public CollectableObject(String identifier, int x, int y, int owidth, 
    int oheight, Collectable collectable, GameObject replaceWith) {
    super(identifier, x, y, owidth, oheight, collectable.getGameObjectImageFile());
    this.collectable = collectable;
    if (replaceWith != null) {
      this.replaceWith = replaceWith;
      this.willReplaceByAnotherGameObject = true;
    } else {
      this.willReplaceByAnotherGameObject = false;
    }
  }

  @Override
    public void draw() {
       if (mouseIsHovering) {
      rectMode(CORNER);
      fill(0);
      rect(mouseX-30, mouseY+20, 85, 50, 20);
      fill(255);
      text("PICK UP", mouseX-10, mouseY +50);
       }
    //  cursor(HAND);
    //} else if(!mouseIsHovering) {
    //  cursor(ARROW);
    //}
  
    super.draw();
  }

  @Override
    public void mouseClicked() {
    if (mouseIsHovering) {
      inventoryManager.addCollectable(collectable);
      sceneManager.getCurrentScene().removeGameObject(this);
      if (willReplaceByAnotherGameObject) {
        sceneManager.getCurrentScene().addGameObject(replaceWith);
      }
    }
  }
}
