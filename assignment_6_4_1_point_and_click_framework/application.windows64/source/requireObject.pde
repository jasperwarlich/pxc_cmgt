class RequireObject extends TextObject {
  private Collectable collectable;
  private GameObject replaceWith;
  public boolean isUsed = false;

  public RequireObject(String identifier, int x, int y, int owidth, int oheight, 
    String gameObjectImageFile, String text, 
    Collectable collectable, GameObject replaceWith) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, text);
    this.collectable = collectable;
    this.replaceWith = replaceWith;
  }

  @Override
    public void mouseClicked() {
    if (mouseIsHovering && inventoryManager.containsCollectable(collectable)) {
      isUsed = true;
      inventoryManager.removeCollectable(collectable);
      sceneManager.getCurrentScene().removeGameObject(this);
      sceneManager.getCurrentScene().addGameObject(replaceWith);
    } else {
      super.mouseClicked();
    }
  }
}
