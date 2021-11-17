int wwidth = 1280;
int wheight = 720;

final SceneManager sceneManager = new SceneManager();
final InventoryManager inventoryManager = new InventoryManager();

//DIALOG BOX
boolean mouseWentDown = false;
PImage dialog;
int bX = 200;
int bY = 100;
String text = "badfbdafbadfb";
StoryBox dialogBox;

//Moving object
Moving moving;

void settings()
{
  size(wwidth, wheight);
}

void setup()
{
  
  Scene strandedIsland = new Scene("strandedIsland", "strandedisland.jpg");
  MoveToSceneObject toBay = new MoveToSceneObject("toBay", 1100, 400, 454/3, 286/3, "arrowRight.png", "bayScene");
  strandedIsland.addGameObject(toBay);
  
  Scene bayScene = new Scene("bayScene", "back01.png");
  //Collectable apple = new Collectable("apple", "back04_apple.png");
  //Collectable apple2 = new Collectable("apple", "back04_apple.png");
  //Collectable apple3 = new Collectable("apple", "back04_apple.png");
  //MoveToSceneObject object7 = new MoveToSceneObject("goToScene04_scene01", 206, 461, 50, 50, "arrowUp.png", "scene04");
  //Scene scene01 = new Scene("scene01", "back01.png");
  //RequireObject loupe01 = new RequireObject("requiresApple_scene01", 206, 461, 50, 50, "zoom.png", "You need an Apple before getting here!", apple, object7);
  //loupe01.setHoverImage("zoomIn.png");
  //scene01.addGameObject(loupe01);
  //TextObject loupe02 = new TextObject("smallText_scene01", 541, 445, 50, 50, "zoom.png", "This object has a text!");
  //loupe02.setHoverImage("zoomIn.png");
  //scene01.addGameObject(loupe02);
  //TextObject loupe03 = new TextObject("largeText_scene01", 46, 687, 50, 50, "zoom.png", "This object has a way longer text. It shows that the windows can be of varied size according to the text.");
  //loupe03.setHoverImage("zoomIn.png");
  //scene01.addGameObject(loupe03);
  //MoveToSceneObject object2 = new MoveToSceneObject("goToScene02_scene01", 708, 445, 50, 50, "arrowRight.png", "scene02");
  //scene01.addGameObject(object2);
  //MoveToSceneObject restaurantSceneMoveTo = new MoveToSceneObject("goToScene06_scene01", 388, 440, 50, 50, "arrowUp.png", "scene05");
  //scene01.addGameObject(restaurantSceneMoveTo);

  //Scene scene02 = new Scene("scene02", "back02.png");
  //MoveToSceneObject object3 = new MoveToSceneObject("goBack_scene02", 350, 700, 50, 50, "arrowDown.png", true);
  //scene02.addGameObject(object3);
  //MoveToSceneObject object4 = new MoveToSceneObject("goToScene03_scene02", 441, 494, 50, 50, "arrowUp.png", "scene03");
  //scene02.addGameObject(object4);

  //Scene scene03 = new Scene("scene03", "back04.png");
  //MoveToSceneObject object5 = new MoveToSceneObject("goBack_scene03", 203, 673, 50, 50, "arrowDown.png", true);
  //scene03.addGameObject(object5);
  //CollectableObject object6 = new CollectableObject("apple_scene03", 325, 366, 123, 101, apple);
  //scene03.addGameObject(object6);
  //CollectableObject object9 = new CollectableObject("apple2_scene03", 500, 366, 123, 101, apple2);
  //scene03.addGameObject(object9);
  //CollectableObject object8 = new CollectableObject("apple3_scene03", 600, 366, 123, 101, apple3);
  //scene03.addGameObject(object8);

  //Scene scene04 = new Scene("scene04", "back03.png");
  //TextObject endGame = new TextObject("smallText_scene04", 430, 590, 50, 50, "medal1.png", "Congratulations. You finished the game!");
  //scene04.addGameObject(endGame);

<<<<<<< HEAD
  ////Dialog Box
  //dialog = loadImage("arrowDown.png");
  //dialogBox = new StoryBox(dialog, bX, bY);
  ////Scene scene05 = ...
=======
  //Dialog Box
  dialog = loadImage("arrowDown.png");
  dialogBox = new StoryBox(dialog, bX, bY, text);
  
  //Moving
  moving = new Moving();
  //Scene scene05 = ...
>>>>>>> bb0170f1e8a8b79d965d108edb2e801065632dec

  
  sceneManager.addScene(strandedIsland);
  sceneManager.addScene(bayScene);
  //sceneManager.addScene(scene01);
  //sceneManager.addScene(scene02);
  //sceneManager.addScene(scene03);
  //sceneManager.addScene(scene04);
}

void draw()
{
  sceneManager.getCurrentScene().draw(wwidth, wheight);
  sceneManager.getCurrentScene().updateScene();
  inventoryManager.clearMarkedForDeathCollectables();
  inventoryManager.drawSlots();
  inventoryManager.drawCollectables();

  //SIMPLE DIALOG BOX
<<<<<<< HEAD
  //dialogBox.update();
=======
  dialogBox.update();
  
  //MOVING
  moving.update();
  
>>>>>>> bb0170f1e8a8b79d965d108edb2e801065632dec
}

void mouseMoved() {
  sceneManager.getCurrentScene().mouseMoved();
}

void mouseClicked() {
  sceneManager.getCurrentScene().mouseClicked();
  mouseWentDown = true;
}
