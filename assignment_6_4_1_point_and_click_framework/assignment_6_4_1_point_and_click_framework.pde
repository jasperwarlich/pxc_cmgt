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
  Collectable frontPiece = new Collectable("frontPiece", "frontpiece.png");
  Collectable pirateFlag = new Collectable("pirateFlag", "pirate_flag.png");
  Collectable shipAsset = new Collectable("shipAsset", "ship_asset.png");
  Collectable woodPiece = new Collectable("woodPiece", "wood_piece.png");
  Collectable map = new Collectable("map", "map.png");

  // FIRST SCENE
  Scene strandedIsland = new Scene("strandedIsland", "wrecked_ship.png");
  MoveToSceneObject toBay = new MoveToSceneObject("toBay", 1100, 400, 454/3, 286/3, "arrowRight.png", "bayScene");
  // Opening dialog
  FirstDialog dialog1 = new FirstDialog("dialog1", 0, 0, 0, 0, new String[]{
    "Crew members: \n \nThe captain is waking up! Thank god he is alright.", 
    "Crew members: \n \nIf it wasn’t for the captain, we all would have been lost to the wrath of the waves!", 
    "Captain: \n \n*wakes up and grunts* Uuuhrgh... that hurt.", 
    "Captain: \n \n*looks back at the crew and ship* She took quite a beating... as did we all.", 
    "Captain: \n \nAye, listen up! We need to get her sailing again. Find the missing parts!", 
    "Crew members: \n \nAye, aye captain!"});

  strandedIsland.addGameObject(toBay);
  strandedIsland.addGameObject(dialog1);

  CollectableObject frontPiece1 = new CollectableObject("frontPiece", 1050, 500, 100, 100, frontPiece);
  strandedIsland.addGameObject(frontPiece1);
  CollectableObject shipAsset1 = new CollectableObject("shipAsset", 850, 300, 250, 250, shipAsset);
  strandedIsland.addGameObject(shipAsset1);

  CollectableObject woodPiece1 = new CollectableObject("woodPiece", 800, 500, 100, 100, woodPiece);
  strandedIsland.addGameObject(woodPiece1);

  MoveToSceneObject moveOn = new MoveToSceneObject("repaired_ship", 50, 400, 454/3, 286/2, "check.png", "repaired_ship");
  RequireObject shipObj1 = new RequireObject("requiresRope", 700, 200, 100, 100, "quest.png", "You need to find a hammer!", rope, moveOn);
  RequireObject shipObj2 = new RequireObject("requiresHammer", 700, 200, 100, 100, "quest.png", "You need to find a rope!", hammer, shipObj1);
  RequireObject shipObj3 = new RequireObject("requiresFrontPiece", 700, 200, 100, 100, "quest.png", "You need to find a front piece!", frontPiece, shipObj2);
  RequireObject shipObj4 = new RequireObject("requiresShipAsset", 700, 200, 100, 100, "quest.png", "You need to find a ship asset!", shipAsset, shipObj3);
  RequireObject shipObj5 = new RequireObject("requiresPirateFlag", 700, 200, 100, 100, "quest.png", "You need to find a pirate flag!", pirateFlag, shipObj4);
  RequireObject shipObj6 = new RequireObject("requiresMap", 700, 200, 100, 100, "quest.png", "You need to find a map!", map, shipObj5);
  RequireObject shipObj7 = new RequireObject("requiresWoodPiece", 700, 200, 100, 100, "quest.png", "You need to find a wood piece!", woodPiece, shipObj6);
  strandedIsland.addGameObject(shipObj7);

  // SECOND SCENE
  Scene bayScene = new Scene("bayScene", "piratecabin.jpg");
  MoveToSceneObject object3 = new MoveToSceneObject("strandedIsland", 50, 400, 100, 100, "arrowLeft2.png", "strandedIsland");
  bayScene.addGameObject(object3);
  CollectableObject rope1 = new CollectableObject("rope1", 900, 550, 100, 100, rope);
  bayScene.addGameObject(rope1);
  CollectableObject hammer1 = new CollectableObject("hammer1", 300, 300, 100, 100, hammer);
  bayScene.addGameObject(hammer1);
  CollectableObject pirateFlag1 = new CollectableObject("pirateFlag", 400, 400, 100, 100, pirateFlag);
  bayScene.addGameObject(pirateFlag1);
  MoveToSceneObject moveOn2 = new MoveToSceneObject("barScene", 1100, 400, 454/3, 286/3, "arrowRight.png", "barScene");

  bayScene.addGameObject(moveOn2);

  // FORTH SCENE
  Scene bar = new Scene("barScene", "bar.png");
  MoveToSceneObject goB = new MoveToSceneObject("bayScene", 50, 500, 100, 80, "arrowLeft2.png", "bayScene");
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
  Player player = new Player("player", -500, 200, 400, 500, "character.png");
  bar.addGameObject(player);
  // repaired_ship SCENE
  Scene sea = new Scene("repaired_ship", "repaired_ship.png");
  MoveToSceneObject sailing = new MoveToSceneObject("sailed_finished", 50, 500, 100, 80, "arrowLeft2.png", "sailed_finished");
  sea.addGameObject(sailing);

  //SAILING SCENE
  Scene sailingScene = new Scene ("sailed_finished", "sailed_finished.png");
  MoveToSceneObject treasureAdv = new MoveToSceneObject("sailed_finished", 50, 600, 100, 80, "arrowLeft2.png", "sailed_finished");
  sailingScene.addGameObject(treasureAdv);
  FirstDialog dialog2 = new FirstDialog("dialog2", 0, 0, 0, 0, new String[]{
    "Crew members: \n \nThe captain is waking up! Thank god he is alright.", 
    "Crew members: \n \nIf it wasn’t for the captain, we all would have been lost to the wrath of the waves!", 
    "Captain: \n \n*wakes up and grunts* Uuuhrgh... that hurt.", 
    "Captain: \n \n*looks back at the crew and ship* She took quite a beating... as did we all.", 
    "Captain: \n \nAye, listen up! We need to get her sailing again. Find the missing parts!", 
    "Crew members: \n \nAye, aye captain!"});
  sailingScene.addGameObject(dialog2);

  //TREASURE SCENE



  // SCENE MANAGER
  sceneManager.addScene(strandedIsland);
  sceneManager.addScene(bayScene);
  sceneManager.addScene(bar);
  sceneManager.addScene(sea);
  sceneManager.addScene(sailingScene);
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
