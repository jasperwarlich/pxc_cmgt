
import processing.sound.*;
import processing.video.*;
Movie movie;


int wwidth = 1280;
int wheight = 720;

public PApplet p = this;

final SceneManager sceneManager = new SceneManager();
final InventoryManager inventoryManager = new InventoryManager();

ArrayList<RequireObject> requiredShipItems = new ArrayList<RequireObject>();

boolean mouseWentDown = false;

PImage birds;

SoundFile background;
SoundFile pickUp;

Movie last;



void settings()
{
  size(wwidth, wheight);
}

void setup()
{

  PApplet p = this;
  Collectable rum = new Collectable("rum", "rum.png");
  CollectableObject rumB = new CollectableObject("rum", 798, 250, 100, 100, rum);
  Collectable treasureKey = new Collectable("key", "key.png");
  RequireObject treasureDetect = new RequireObject("requiresKey", 798, 263, 91, 53, "blank.png", "You need a key!", treasureKey, rumB);
  movie = new Movie(this, "treasureCutscene.mp4");
  //movie.loop();
  pickUp = new SoundFile(this, "PickUpItem.wav");
  
  last = new Movie(this, "treasureCutscene.mp4");
  SoundFile rainMusic = new SoundFile(p, "pirate.wav");
  Scene strandedIsland = new Scene("strandedIsland", "wrecked_ship.png", rainMusic);
  background = new SoundFile(this, "background.wav");
  //background.loop();
  frameRate(60);
  Collectable rope;
  rope  = new Collectable("rope", "rope.png");
  Collectable hammer = new Collectable("hammer", "hammer.png");

  Collectable frontPiece = new Collectable("frontPiece", "frontpiece.png");
  Collectable pirateFlag = new Collectable("pirateFlag", "pirate_flag.png");
  Collectable shipAsset = new Collectable("shipAsset", "ship_asset.png");
  Collectable woodPiece = new Collectable("woodPiece", "wood_piece.png");
  Collectable map = new Collectable("map", "map.png");


  // START
  Scene start = new Scene("start", "titlescreen.png", rainMusic);
  MoveToSceneObject play = new MoveToSceneObject("toStart", 458, 400, 400, 150, "blank.png", "night");
  start.addGameObject(play);

  // FIRST SCENE
  MoveToSceneObject toBay = new MoveToSceneObject("toBay", 1100, 600, 454/3, 286/3, "arrowRight.png", "bayScene");

  MovingObject birds = new MovingObject("birds", 1, -150, 600, 600, "birds.png");

  // Opening dialog
  Scene night = new Scene("night", "wakingup_scene.png", rainMusic);

  // Ship Repaired
  Scene repairedShip = new Scene("repairedShip", "repaired_ship.png", rainMusic);
  MoveToSceneObject sail = new MoveToSceneObject("sailing_cutscene", 50, 600, 454/3, 286/3, "arrowLeft2.png", "sailing_cutscene");
  RequireObject needMap = new RequireObject("requiresMap", 50, 600, 454/3, 286/3, "arrowLeft2.png", "You need to find a map!", map, sail);
  repairedShip.addGameObject(needMap);
  MoveToSceneObject moveToBar = new MoveToSceneObject("barScene", 1100, 600, 454/3, 286/3, "arrowRight.png", "barScene");
  repairedShip.addGameObject(moveToBar);

  CollectableObject frontPiece1 = new CollectableObject("frontPiece", 1050, 500, 100, 100, frontPiece);
  CollectableObject shipAsset1 = new CollectableObject("shipAsset", 1021, 286, 250, 250, shipAsset);


  CollectableObject woodPiece1 = new CollectableObject("woodPiece", 800, 500, 100, 100, woodPiece);

  GameObject woodImg = new GameObject("wood", 568, 412, 127, 103, "wood_piece.png");
  GameObject pirateFlagImg = new GameObject("pirateFlag", 300, -32, 153, 105, "pirate_flag.png");
  GameObject frontPieceImg = new GameObject("frontPiece", 763, 225, 150, 150, "frontpiece.png");
  GameObject shipAssetImg = new GameObject("shipAsset", 315, 38, 261, 123, "ship_asset.png");



  //MoveToSceneObject moveOn = new MoveToSceneObject("repaired_ship", 50, 400, 454/3, 286/2, "check.png", "repaired_ship");
  RequireObject shipObj3 = new RequireObject("requiresFrontPiece", 763, 195, 175, 164, "frontpiece_sil.png", "Captain: \nThis front piece seems to missing..", frontPiece, frontPieceImg);
  RequireObject shipObj4 = new RequireObject("requiresShipAsset", 325, 38, 261, 123, "ship_asset_sil.png", "Captain: \nWithout a main mast we won't be able to sail...", shipAsset, shipAssetImg);
  RequireObject shipObj5 = new RequireObject("requiresPirateFlag", 330, -32, 153, 105, "pirate_flag_sil.png", "Captain: \nWe must have a pirate flag to scare of other sailors.", pirateFlag, pirateFlagImg);


  RequireObject shipObj7 = new RequireObject("requiresWoodPiece", 568, 412, 127, 103, "wood_piece_sil.png", "Captain: \nHmm.. I probabably need wood to fill this hole.", woodPiece, woodImg);

  requiredShipItems.add(shipObj3);
  requiredShipItems.add(shipObj4);
  requiredShipItems.add(shipObj5);
  requiredShipItems.add(shipObj7);

  FirstDialog dialog1 = new FirstDialog("dialog1", 0, 0, 0, 0, new String[]{
    "Crew members: \n \nThe captain is waking up! Thank god he is alright.", 
    "Crew members: \n \nIf it wasn???t for the captain, we all would have been lost to the wrath of the waves!", 
    "Captain: \n \n*wakes up and grunts* Uuuhrgh... that hurt.", 
    "Captain: \n \n*looks back at the crew and ship* She took quite a beating... as did we all.", 
    "Captain: \n \nAye, listen up! We need to get her sailing again. Find the missing parts!", 
    "Crew members: \n \nAye, aye captain!"}, requiredShipItems);

  FirstDialog dialog3 = new FirstDialog("findMap", 0, 0, 0, 0, new String[]{}, requiredShipItems, true);
  night.addGameObject(dialog1);
  repairedShip.addGameObject(dialog3);


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
  Scene bayScene = new Scene("bayScene", "piratecabin.jpg", rainMusic);
  MoveToSceneObject object3 = new MoveToSceneObject("strandedIsland", 50, 600, 454/3, 286/3, "arrowLeft2.png", "strandedIsland");
  bayScene.addGameObject(object3);
  CollectableObject rope1 = new CollectableObject("rope1", 900, 550, 100, 100, rope);
  bayScene.addGameObject(rope1);
  CollectableObject hammer1 = new CollectableObject("hammer1", 300, 300, 100, 100, hammer);
  bayScene.addGameObject(hammer1);
  CollectableObject pirateFlag1 = new CollectableObject("pirateFlag", 400, 400, 100, 100, pirateFlag);
  bayScene.addGameObject(pirateFlag1);

  // FORTH SCENE
  Scene bar = new Scene("barScene", "bar_scene.png", rainMusic);
  MoveToSceneObject goB = new MoveToSceneObject("repairedShip", 50, 600, 454/3, 286/3, "arrowLeft2.png", "repairedShip");
  bar.addGameObject(goB);
  CollectableObject map1 = new CollectableObject("map", 1150, 200, 100, 100, map);
  bar.addGameObject(map1);
  Player player = new Player("player", -500, 200, 400, 500, "character.png");
  bar.addGameObject(player);
  StoryBox pirate1 = new StoryBox("pirate", 650, 200, 500, 500, "pirate.png", new String[]{
    "Ahoy, traveller. What can I get ya.", //The bartender
    "*You pass him some gold.*", //The player
    "Beer, none of that watered down piss. I want the good stuff", //The player
    "That???ll cost you some ,lad", //The bartender
    "*You put down a few coins more*", //The player
    "Here you go laddie, best beer in the house! Liquid gold, as we call it ???ere", //The bartender
    "Pfft??? *Hick* liquid gold ain???t real gold old man, *hick* real gold ish out there.", //Drunk sailor
    "And if you had some of that real gold you???d be drinkin??? better.", // The bartender
    "*hick* I know where it ish *hick*", //Drunk sailor
    "Don???t listen to this drunk fool, or it???ll get ya killed"}); // The bartender   

  bar.addGameObject(pirate1);

  //SAILING SCENE
  Scene sailingScene = new Scene ("sailing_cutscene", "sailing_cutscene.png", rainMusic);
  MoveToSceneObject inTheSea = new MoveToSceneObject("treasure_scene", 50, 600, 454/3, 286/3, "arrowLeft2.png", "treasure_scene");
  sailingScene.addGameObject(inTheSea);

  //TREASURE SCENE
  FirstDialog treasureDialog = new FirstDialog("treasureDialog",0,0,0,0, new String[]{
    "Crew: \n???You did it captain we made it! We are rich!???",
    "Captain: \n???Not yet there that chest seems to be locked???"
  });
 
  Scene treasureScene = new Scene ("treasure_scene", "treasure_scene.png", rainMusic);
  CollectableObject keyT = new CollectableObject("treasureKey", 800, 500, 100, 100, treasureKey);
  treasureScene.addGameObject(keyT);
  //StoryBox rum = new StoryBox("rum", 798, 250, 100, 100, "rum.png", new String[]{
  //"Congratulations guys!! We just found the best rum in the world!", "Let's get drunk, we deserve it!", "Aye, aye captain!"});
  treasureScene.addGameObject(treasureDetect);
  treasureScene.addGameObject(treasureDialog);
  
  


  MoveToSceneObject endScene = new MoveToSceneObject("sailing_cutscene_back", 1100, 400, 454/3, 286/3, "arrowRight.png", "sailing_cutscene_back");
  RequireObject goOn = new RequireObject("requiresRum", 1100, 400, 454/3, 286/3, "arrowRight.png", "Find the treasure!", rum, endScene);
  treasureScene.addGameObject(goOn);



  //End Scene
  Scene endSailing = new Scene ("sailing_cutscene_back", "sailing_cutscene_back.png", rainMusic);
  MoveToSceneObject end = new MoveToSceneObject("endingscreen", 1100, 600, 454/3, 286/3, "arrowRight.png", "endingscreen");
  endSailing.addGameObject(end);

  //End end scren
  Scene endS = new Scene ("endingscreen", "endingscreen.png", rainMusic);
  MoveToSceneObject playAgain = new MoveToSceneObject("start", 350, 200, 575, 210, "blank.png", "start");
  endS.addGameObject(playAgain);

  // SCENE MANAGER
  sceneManager.addScene(start);
  sceneManager.addScene(night);
  sceneManager.addScene(strandedIsland);
  sceneManager.addScene(repairedShip);
  sceneManager.addScene(bayScene);
  sceneManager.addScene(bar);
  sceneManager.addScene(sailingScene);
  sceneManager.addScene(treasureScene);
  sceneManager.addScene(endSailing);
  sceneManager.addScene(endS);
}

void draw()
{
 
  sceneManager.getCurrentScene().draw(wwidth, wheight);
  sceneManager.getCurrentScene().updateScene();
  inventoryManager.clearMarkedForDeathCollectables();
  inventoryManager.drawSlots();
  inventoryManager.drawCollectables();
  mouseWentDown = false;
  if (play)
  {
    image(last, 0, 0);
  }
  if (playMusic) {
    //pickUp.play();
    playMusic = false;
  }
  //println(mouseX, mouseY);
}

void movieEvent(Movie movie) {
  movie.read();
}

void mouseMoved() {
  sceneManager.getCurrentScene().mouseMoved();
}
void mouseClicked() {
  sceneManager.getCurrentScene().mouseClicked();
  mouseWentDown = true;
}
