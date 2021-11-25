boolean playMusic = false;

import processing.sound.*;


class InventoryManager {
  private ArrayList<Collectable> collectables;
  private ArrayList<Collectable> markedForDeathCollectables;


  public InventoryManager() {
    collectables = new ArrayList<Collectable>();
    markedForDeathCollectables = new ArrayList<Collectable>();
  }

  public void addCollectable(Collectable collectable) {
    collectables.add(collectable);
    playMusic = true;
        SoundFile pickup = new SoundFile(p, "PickUpItem.wav");

    pickup.play();
  }

  public void removeCollectable(Collectable collectable) {
    markedForDeathCollectables.add(collectable);
  }

  public boolean containsCollectable(Collectable collectable) {
    return collectables.contains(collectable);
  }

  public void clearMarkedForDeathCollectables() {
    if (markedForDeathCollectables.size() > 0) {
      for (Collectable collectable : markedForDeathCollectables) {
        collectables.remove(collectable);
      }
      markedForDeathCollectables  = new ArrayList<Collectable>();
    }
  }
  // Draws all the items collected at slot position
  public void drawCollectables() {
    int x = 20;
    for (Collectable c : collectables) {
      PImage gameObjectImage;
      gameObjectImage = loadImage(c.getGameObjectImageFile());
      image(gameObjectImage, x, 30-10, 40*1.5, 40*1.5);
      x += 100;
    }
  }

  // Draws a simple inventory with 3 slots
  public void drawSlots() {
    int x = 0;
    //for (int i = 0; i < 3; i++) {
    //  stroke(255);
    //  fill(0, 55);
    //  rect(x, 0, 80, 80);
    //  x += 80;
    //}
    for (Collectable c : collectables) {
      stroke(255);
      fill(0, 55);
      rect(x, 0, 100, 100);
      x += 100;
    }
  }
}
