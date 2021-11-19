int wwidth = 1280;
int wheight = 720;

final SceneManager sceneManager = new SceneManager();
final InventoryManager inventoryManager = new InventoryManager();

boolean mouseWentDown = false;

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

  // THIRD SCENE
  Scene bar = new Scene("barScene", "bar.png");
  MoveToSceneObject goB = new MoveToSceneObject("bayScene", 50, 500, 100, 80, "arrowLeft2.png", true);
  bar.addGameObject(goB);
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

  // SEA SCENE
  Scene sea = new Scene("seaScene", "sea.jpg");

  MovingObject ship = new MovingObject("ship", 1100, 400, 100, 100);
  sea.addGameObject(ship);


  // SCENE MANAGER
  sceneManager.addScene(strandedIsland);
  sceneManager.addScene(bayScene);
  sceneManager.addScene(bar);
  sceneManager.addScene(sea);
}

void draw()
{
  sceneManager.getCurrentScene().draw(wwidth, wheight);
  sceneManager.getCurrentScene().updateScene();
  inventoryManager.clearMarkedForDeathCollectables();
  inventoryManager.drawSlots();
  inventoryManager.drawCollectables();
  mouseWentDown = false;
}
void mouseMoved() {
  sceneManager.getCurrentScene().mouseMoved();
}
void mouseClicked() {
  sceneManager.getCurrentScene().mouseClicked();
  mouseWentDown = true;
}
