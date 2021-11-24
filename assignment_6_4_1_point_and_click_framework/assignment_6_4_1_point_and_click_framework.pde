import processing.sound.*;

int wwidth = 1280;
int wheight = 720;

final SceneManager sceneManager = new SceneManager();
final InventoryManager inventoryManager = new InventoryManager();
ArrayList<RequireObject> requiredShipItems = new ArrayList<RequireObject>();


boolean mouseWentDown = false;

PImage birds;

SoundFile background;

void settings()
{
  size(wwidth, wheight);
}

void setup()
{
  
  Scene strandedIsland = new Scene("strandedIsland", "wrecked_ship.png");
  background = new SoundFile(this, "background.wav");
  background.loop();
  frameRate(60);
  Collectable rope = new Collectable("rope", "rope.png");
  Collectable hammer = new Collectable("hammer", "hammer.png");
  ArrayList<Collectable> shipRepair = new ArrayList<Collectable>();

  Collectable frontPiece = new Collectable("frontPiece", "frontpiece.png");
  Collectable pirateFlag = new Collectable("pirateFlag", "pirate_flag.png");
  Collectable shipAsset = new Collectable("shipAsset", "ship_asset.png");
  Collectable woodPiece = new Collectable("woodPiece", "wood_piece.png");
  Collectable map = new Collectable("map", "map.png");
  
  
  // START
  Scene start = new Scene("start", "titlescreen.png");
  MoveToSceneObject play = new MoveToSceneObject("toStart", 350,200,575,210,"blank.png", "night");
  start.addGameObject(play);

  // FIRST SCENE
  
  
  MoveToSceneObject toBay = new MoveToSceneObject("toBay", 1100, 400, 454/3, 286/3, "arrowRight.png", "bayScene");
  MovingObject birds = new MovingObject("birds", 1, -150, 600, 600, "birds.png");
  
  // Opening dialog
 
  Scene night = new Scene("night", "wrecked_ship_night.png");
  
  // Ship Repaired
  Scene repairedShip = new Scene("repairedShip", "repaired_ship.png");
  MoveToSceneObject moveToBar = new MoveToSceneObject("barScene", 1100, 400, 454/3, 286/3, "arrowRight.png", "barScene");
  repairedShip.addGameObject(moveToBar);


  
 // CollectableObject wood1 = new CollectableObject("wood", 1150, 200, 100, 100, wood);
 // strandedIsland.addGameObject(wood1);
 // MoveToSceneObject inTheSea = new MoveToSceneObject("seaScene", 50, 600, 100, 100, "arrowLeft2.png", "seaScene");
 // RequireObject requiresWood = new RequireObject("requiresWood", 565,417,127,103,"blank.png", "You need to find some wood", wood, inTheSea);
 // strandedIsland.addGameObject(requiresWood);
 //requiresWood.used();

  CollectableObject frontPiece1 = new CollectableObject("frontPiece", 1050, 500, 100, 100, frontPiece);
  CollectableObject shipAsset1 = new CollectableObject("shipAsset", 850, 300, 250, 250, shipAsset);
  

  CollectableObject woodPiece1 = new CollectableObject("woodPiece", 800, 500, 100, 100, woodPiece);
  
  
  GameObject woodImg = new GameObject("wood", 568,412,127,103, "wood_piece.png");
  GameObject pirateFlagImg = new GameObject("pirateFlag", 330, -32, 153, 105, "pirate_flag.png");
  GameObject frontPieceImg = new GameObject("frontPiece", 763, 195, 175, 164, "frontpiece.png");
  GameObject shipAssetImg = new GameObject("shipAsset", 325, 38, 261, 123, "ship_asset.png");
  
  MoveToSceneObject moveOn = new MoveToSceneObject("repaired_ship", 50, 400, 454/3, 286/2, "check.png", "repaired_ship");
  RequireObject shipObj3 = new RequireObject("requiresFrontPiece", 763, 195, 175, 164, "frontpiece_sil.png", "You need to find a front piece!", frontPiece, frontPieceImg);
  RequireObject shipObj4 = new RequireObject("requiresShipAsset", 325, 38, 261, 123, "ship_asset_sil.png", "You need to find a ship asset!", shipAsset, shipAssetImg);
  RequireObject shipObj5 = new RequireObject("requiresPirateFlag", 330, -32, 153, 105, "pirate_flag_sil.png", "You need to find a pirate flag!", pirateFlag, pirateFlagImg);
 // RequireObject shipObj6 = new RequireObject("requiresMap", 700, 200, 100, 100, "quest.png", "You need to find a map!", map, shipObj5);
  RequireObject shipObj7 = new RequireObject("requiresWoodPiece", 568,412,127,103, "wood_piece_sil.png", "Hmm.. I probabably need wood to fill this hole.", woodPiece, woodImg);
 
  
  
  requiredShipItems.add(shipObj3);
  requiredShipItems.add(shipObj4);
  requiredShipItems.add(shipObj5);
  requiredShipItems.add(shipObj7);
    
   FirstDialog dialog1 = new FirstDialog("dialog1", 0, 0, 0, 0, new String[]{
      "Crew members: \n \nThe captain is waking up! Thank god he is alright.", 
      "Crew members: \n \nIf it wasn’t for the captain, we all would have been lost to the wrath of the waves!", 
      "Captain: \n \n*wakes up and grunts* Uuuhrgh... that hurt.", 
      "Captain: \n \n*looks back at the crew and ship* She took quite a beating... as did we all.", 
      "Captain: \n \nAye, listen up! We need to get her sailing again. Find the missing parts!", 
      "Crew members: \n \nAye, aye captain!"}, requiredShipItems);
      
   FirstDialog dialog3 = new FirstDialog("findMap",0,0,0,0, new String[]{}, requiredShipItems, true);
      
      night.addGameObject(dialog1);
      repairedShip.addGameObject(dialog3);
      
      if(requiredShipItems.get(0).isUsed == true && requiredShipItems.get(1).isUsed == true && requiredShipItems.get(2).isUsed == true && requiredShipItems.get(3).isUsed == true) {
        println("Done!");
      }
      
    strandedIsland.addGameObject(dialog1);
      
    strandedIsland.addGameObject(birds);
    strandedIsland.addGameObject(shipAsset1);
    strandedIsland.addGameObject(woodPiece1);
    strandedIsland.addGameObject(shipObj7);
    strandedIsland.addGameObject(shipObj5);
    strandedIsland.addGameObject(shipObj4);
    strandedIsland.addGameObject(shipObj3);
    strandedIsland.addGameObject(frontPiece1);
    strandedIsland.addGameObject(toBay);
    
  
  

  

  

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

 
  //MoveToSceneObject moveOn = new MoveToSceneObject("barScene", 1100, 400, 454/3, 286/3, "arrowRight.png", "barScene");
  //RequireObject shipObj2 = new RequireObject("requiresRope", 700, 200, 100, 100, "quest.png", "You need to find a hammer!", hammer, moveOn);

  bayScene.addGameObject(moveOn2);

  // FORTH SCENE
  Scene bar = new Scene("barScene", "bar_scene.png");
  MoveToSceneObject goB = new MoveToSceneObject("bayScene", 50, 500, 100, 80, "arrowLeft2.png", "bayScene");
  bar.addGameObject(goB);
  CollectableObject map1 = new CollectableObject("map", 1150, 200, 50, 50, map);
  bar.addGameObject(map1);
  Player player = new Player("player", -500, 200, 400, 500, "character.png");
  bar.addGameObject(player);
  StoryBox pirate1 = new StoryBox("pirate", 650, 200, 500, 500, "pirate.png", new String[]{
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
  
  // repaired_ship SCENE
  Scene sea = new Scene("repaired_ship", "repaired_ship.png");
  MoveToSceneObject sailing = new MoveToSceneObject("sailed_finished", 50, 500, 100, 80, "arrowLeft2.png", "sailed_finished");
  sea.addGameObject(sailing);
  MovingObject birds3 = new MovingObject("birds", 0, -100, 600, 600, "birds.png");
  sea.addGameObject(birds3);
  
  //SAILING SCENE
  Scene sailingScene = new Scene ("sailed_finished", "sailed_finished.png");
  MoveToSceneObject treasureAdv = new MoveToSceneObject("sailed_finished", 50, 600, 100, 80, "arrowLeft2.png", "sailed_finished");
  sailingScene.addGameObject(treasureAdv);
  MovingObject birds2 = new MovingObject("birds", 0, -100, 600, 600, "birds.png");
  sailingScene.addGameObject(birds2);
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
  sceneManager.addScene(start);
  sceneManager.addScene(night);
  sceneManager.addScene(strandedIsland);
  sceneManager.addScene(repairedShip);
  sceneManager.addScene(bayScene);
  sceneManager.addScene(bar);
  sceneManager.addScene(sea);
  sceneManager.addScene(sailingScene);
}

void draw()
{
  
  
  //background.loop();
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
