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
int x = 5;
//Moving object
String textt = "COMING SOON...";
void settings()
{
  size(wwidth, wheight);
}

void setup()
{

  frameRate(60);
  Collectable rope = new Collectable("rope", "rope.png");
  Collectable hammer = new Collectable("hammer", "hammer.png");

  Collectable map = new Collectable("map", "map.png");

  // FIRST SCENE
  Scene strandedIsland = new Scene("strandedIsland", "strandedisland.jpg");
  MoveToSceneObject toBay = new MoveToSceneObject("toBay", 1100, 400, 454/3, 286/3, "arrowRight.png", "bayScene");
  strandedIsland.addGameObject(toBay);

  CollectableObject rope1 = new CollectableObject("rope1", 1150, 200, 50, 50, rope);
  strandedIsland.addGameObject(rope1);

  MoveToSceneObject inTheSea = new MoveToSceneObject("seaScene", 50, 600, 100, 100, "arrowLeft2.png", "seaScene");
  RequireObject newWay = new RequireObject("requiresRope", 50, height/2, 100, 100, "quest.png", "Talk with the pirate and get the map", map, inTheSea);
  strandedIsland.addGameObject(newWay);
  StoryBox dialogB = new StoryBox("dialog", 760, 120, 100, 100, "dialogBox.png", new String[]{"Where am I? Is that an island?", "I think we shipwrecked!", "We have to repair my ship.", "Let's find some tools!"});
  strandedIsland.addGameObject(dialogB);


  //if(shipObj1.isUsed == true) {
  //    strandedIsland.addGameObject(toBay);
  //}


  // SECOND SCENE
  Scene bayScene = new Scene("bayScene", "piratecabin.jpg");
  MoveToSceneObject object3 = new MoveToSceneObject("strandedIsland", 50, 400, 100, 100, "arrowLeft2.png", true);
  bayScene.addGameObject(object3);
  CollectableObject hammer1 = new CollectableObject("hammer1", 300, 300, 100, 100, hammer);
  bayScene.addGameObject(hammer1);

  MoveToSceneObject moveOn = new MoveToSceneObject("barScene", 1100, 400, 454/3, 286/3, "arrowRight.png", "barScene");
  RequireObject shipObj2 = new RequireObject("requiresRope", 700, 200, 100, 100, "quest.png", "You need to find a hammer!", hammer, moveOn);
  RequireObject shipObj1 = new RequireObject("requiresHammer", 700, 200, 100, 100, "quest.png", "You need to find a rope!", rope, shipObj2);
  bayScene.addGameObject(shipObj1);

  //MovingObject cube = new MovingObject("cube", 0, 0, 100, 100);
  //bayScene.addGameObject(cube);


  // BAR SCENE
  //MovingObject cube = new MovingObject("cube", 0, 0, 100, 100);

  //bayScene.addGameObject(cube);

  // THIRD SCENE
  // Scene newScene = new Scene("newScene", "back02.png");
  Scene bar = new Scene("barScene", "bar.png");
  //MoveToSceneObject toBar = new MoveToSceneObject("toBar", 1100, 600, 100, 80, "arrowRight.png", "barScene");
  //bayScene.addGameObject(toBar);
  MoveToSceneObject goB = new MoveToSceneObject("bayScene", 50, 500, 100, 80, "arrowLeft2.png", true);
  bar.addGameObject(goB);

  // SEA SCENE
  Scene sea = new Scene("seaScene", "sea.jpg");

  CollectableObject map1 = new CollectableObject("map", 1150, 200, 50, 50, map);
  bar.addGameObject(map1);

  StoryBox pirate1 = new StoryBox("pirate", 650, 200, 500, 500, "pirate2.png", new String[]{

    "Ahoy, traveller. What can I get ya.", //The bartender
    "*You pass him some gold.*", //The player
    "Beer, none of that watered down piss. I want the good stuff", //The player
    "That’ll cost you some ,lad", //The bartender
    "*You put down a few coins more*", //The player
    "Here you go laddie, best beer in the house! Liquid gold, as we call it ‘ere", //The bartender
    "Pfft… *Hick* liquid gold ain’t real gold old man, *hick* real gold ish out there.", //Drunk sailor
    "And if you had some of that real gold you’d be drinkin’ better.", // The bartender
    "*hick* I know where it ish *hick*", //Drunk sailor
    "Don’t listen to this drunk fool, or it’ll get ya killed"}); // The bartender 
    
  bar.addGameObject(pirate1);

  //CollectableObject object6 = new CollectableObject("apple_scene03", 325, 366, 123, 101, apple);


  //Scene newScene = new Scene("newScene", "back02.png");

  //CollectableObject object6 = new CollectableObject("apple_scene03", 325, 366, 123, 101, apple);

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

  ////Scene scene05 = ...

  //Scene scene05 = ...


  sceneManager.addScene(strandedIsland);
  sceneManager.addScene(bayScene);
  //sceneManager.addScene(newScene);
  //sceneManager.addScene(scene01);
  sceneManager.addScene(bar);

  //sceneManager.addScene(newScene);
  //sceneManager.addScene(scene01);

  sceneManager.addScene(sea);

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
  mouseWentDown = false;
  //println(mouseWentDown);
}
void mouseMoved() {
  sceneManager.getCurrentScene().mouseMoved();
}

void mouseClicked() {
  sceneManager.getCurrentScene().mouseClicked();
  mouseWentDown = true;
}
