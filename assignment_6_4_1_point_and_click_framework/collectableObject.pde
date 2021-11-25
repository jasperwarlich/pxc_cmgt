class CollectableObject extends GameObject { 
  private Collectable collectable;
  private GameObject replaceWith;
  private boolean willReplaceByAnotherGameObject;
  String identifier;

  public CollectableObject(String identifier, int x, int y, int owidth, 
    int oheight, Collectable collectable) {
    this(identifier, x, y, owidth, oheight, collectable, null);
    this.identifier = identifier;
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
      cursor(HAND);
       }
       cursor(ARROW);
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
       FirstDialog keyFound = new FirstDialog("treasureDialog",0,0,0,0, new String[]{
          "Captain: \n“I bet this will open that chest”"
        });
        if(identifier == "treasureKey") {
          sceneManager.getCurrentScene().addGameObject(keyFound);
        }
      if (willReplaceByAnotherGameObject) {
        sceneManager.getCurrentScene().addGameObject(replaceWith);
      }
    }
  }
}
