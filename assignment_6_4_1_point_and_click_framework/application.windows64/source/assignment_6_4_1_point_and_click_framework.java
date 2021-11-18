import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Stack; 
import java.util.HashMap; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class assignment_6_4_1_point_and_click_framework extends PApplet {

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
public void settings()
{
  size(wwidth, wheight);
}

public void setup()
{

  frameRate(60);
  Collectable rope = new Collectable("rope", "rope.png");
  Collectable hammer = new Collectable("hammer", "hammer.png");

  Collectable map = new Collectable("map", "map.png");

  // FIRST SCENE
  Scene strandedIsland = new Scene("strandedIsland", "strandedisland.jpg");
  MoveToSceneObject toBay = new MoveToSceneObject("toBay", 1100, 400, 454/3, 286/3, "arrowRight.png", "bayScene");
  strandedIsland.addGameObject(toBay);
  MoveToSceneObject moveOn = new MoveToSceneObject("newScene", 1100, 400, 454/3, 286/3, "arrowRight.png", "newScene");
  CollectableObject rope1 = new CollectableObject("rope1", 1150, 200, 50, 50, rope);
  strandedIsland.addGameObject(rope1);
  RequireObject shipObj2 = new RequireObject("requiresRope", 500, 400, 100, 100, "quest.png", "You need to find a hammer!", hammer, moveOn);

  RequireObject shipObj1 = new RequireObject("requiresHammer", 500, 400, 100, 100, "quest.png", "You need to find a rope!", rope, shipObj2);
  strandedIsland.addGameObject(shipObj1);


  MoveToSceneObject inTheSea = new MoveToSceneObject("seaScene", 50, 600, 100, 100, "arrowLeft2.png", "seaScene");
  RequireObject newWay = new RequireObject("requiresMap", 50, 600, 100, 100, "arrowLeft2.png", "Talk with the pirate and get the map", map, inTheSea);
  strandedIsland.addGameObject(newWay);


  //if(shipObj1.isUsed == true) {
  //    strandedIsland.addGameObject(toBay);
  //}


  // SECOND SCENE
  Scene bayScene = new Scene("bayScene", "piratecabin.jpg");
  MoveToSceneObject object3 = new MoveToSceneObject("goBack_scene02", 50, 400, 100, 100, "arrowLeft2.png", true);
  bayScene.addGameObject(object3);
  CollectableObject hammer1 = new CollectableObject("hammer1", 300, 300, 100, 100, hammer);
  bayScene.addGameObject(hammer1);
  //MovingObject cube = new MovingObject("cube", 0, 0, 100, 100);
  //bayScene.addGameObject(cube);


  // BAR SCENE
  //MovingObject cube = new MovingObject("cube", 0, 0, 100, 100);

  //bayScene.addGameObject(cube);

  // THIRD SCENE
  // Scene newScene = new Scene("newScene", "back02.png");
  Scene bar = new Scene("barScene", "bar.png");
  MoveToSceneObject toBar = new MoveToSceneObject("toBar", 1100, 600, 100, 80, "arrowRight.png", "barScene");
  bayScene.addGameObject(toBar);
  MoveToSceneObject goB = new MoveToSceneObject("bayScene", 50, 500, 100, 80, "arrowLeft2.png", true);
  bar.addGameObject(goB);

  // SEA SCENE
  Scene sea = new Scene("seaScene", "sea.jpg");

  CollectableObject map1 = new CollectableObject("map", 1150, 200, 50, 50, map);
  bar.addGameObject(map1);

  StoryBox pirate1 = new StoryBox("pirate", 650, 200, 500, 500, "pirate2.png", new String[]{"Hello sailor! ", "Bye", "Welcome"});
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

public void draw()
{
  sceneManager.getCurrentScene().draw(wwidth, wheight);
  sceneManager.getCurrentScene().updateScene();
  inventoryManager.clearMarkedForDeathCollectables();
  inventoryManager.drawSlots();
  inventoryManager.drawCollectables();
  mouseWentDown = false;
  //println(mouseWentDown);
}
public void mouseMoved() {
  sceneManager.getCurrentScene().mouseMoved();
}

public void mouseClicked() {
  sceneManager.getCurrentScene().mouseClicked();
  mouseWentDown = true;
}
class MovingObject extends GameObject {
//MOVING OBJECTS TO A CERTAIN POINT (TAKES THE POSITION WHEN YOU CLICK SOMEWHERE)
  float x;
  String identifier;
  float y;
  float mousePosX;
  float mousePosY;
  int owidth;
  int oheight;
  float speed = .01f;
  
  public MovingObject(String identifier, int x, int y, int owidth, int oheight) {
    super(identifier, x, y, owidth, oheight);
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
  }
  
  public void draw() {
    fill(0);
    x = lerp(x, mousePosX, speed);
    y = lerp(y, mousePosY, speed);
    if (mousePressed) {
      mousePosX = mouseX;
      mousePosY = mouseY;
    }
    rect(x, y, owidth, oheight);
  }
}
class Collectable {
  private String name;
  private String gameObjectImageFile;
  //Could be expanded to add an amount, for example

  public Collectable(String name, String gameObjectImageFile) {
    this.name = name;
    this.gameObjectImageFile = gameObjectImageFile;
  }

  public String getName() { 
    return name;
  }

  public String getGameObjectImageFile() { 
    return gameObjectImageFile;
  } 

  @Override 
    public boolean equals(Object obj) { 
    if (obj == this) { 
      return true;
    } 
    if (obj == null || obj.getClass() != this.getClass()) { 
      return false;
    } 
    Collectable otherCollectable = (Collectable) obj; 
    return otherCollectable.getName().equals(this.name);
  } 

  @Override 
    public int hashCode() { 
    final int prime = 13;
    return prime * this.name.hashCode();
  }
}
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
      cursor(HAND);
    } else if(!mouseIsHovering) {
      cursor(ARROW);
    }
  
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
class GameObject {
  protected int x;
  protected int y;
  protected int owidth;
  protected int oheight;
  private String identifier;
  public boolean hasImage;
  private boolean hasHoverImage;
  private PImage gameObjectImage;
  private PImage gameObjectImageHover;
  protected boolean mouseIsHovering;
  boolean hand = false;

  public GameObject(String identifier, int x, int y, int owidth, int oheight) {
    this(identifier, x, y, owidth, oheight, "");
  }

  public GameObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile) {
    this.identifier = identifier;
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.hasImage = !gameObjectImageFile.equals(""); 
    if (this.hasImage) {
      this.gameObjectImage = loadImage(gameObjectImageFile);
    }
    hasHoverImage = false;
    mouseIsHovering = false;
  }

  public void setHoverImage(String gameObjectImageHoverFile) {
    this.gameObjectImageHover = loadImage(gameObjectImageHoverFile);
    hasHoverImage = true;
  }

  public void draw() {
    if (hasImage) {
      if (mouseIsHovering && hasHoverImage) {
        image(gameObjectImageHover, x, y, owidth, oheight);
      } else {
        image(gameObjectImage, x, y, owidth, oheight);
      }
    }
    //if(identifier == "pirate" && mouseIsHovering && mousePressed){
    //println("sdsadas");
    //}
    //if(mouseIsHovering) {
    //  cursor(HAND);
    //} else {
    //  cursor(ARROW);
    //}
    
    if(mouseIsHovering) {
      cursor(HAND);
      hand = true;
    } else {
      cursor(ARROW);
      hand = false;
    }
     if(hand == true) {
       cursor(HAND);
  } else {
    cursor(ARROW);

  }
  }
  
 

  //  if (mouseIsHovering) {
  //    rectMode(CORNER);
  //    fill(0);
  //    rect(mouseX, mouseY, 85, 50, 20);
  //    fill(255);
  //    text("Go further!", mouseX + 10, mouseY +23);
  //    cursor(HAND);
  //  } else if(!mouseIsHovering) {
  //    cursor(ARROW);
  //  }
  //}

  public void mouseMoved() {
    mouseIsHovering = false;
    if (mouseX >= x && mouseX <= x + owidth &&
      mouseY >= y && mouseY <= y + oheight) {
      mouseIsHovering = true;
    }
  }

  public void mouseClicked() {
  }

  public String getIdentifier() {
    return this.identifier;
  }

  @Override 
    public boolean equals(Object obj) { 
    if (obj == this) { 
      return true;
    } 
    if (obj == null || obj.getClass() != this.getClass()) { 
      return false;
    } 
    GameObject otherGameObject = (GameObject) obj; 
    return otherGameObject.getIdentifier().equals(this.identifier);
  } 

  @Override 
    public int hashCode() { 
    final int prime = 11;
    return prime * this.identifier.hashCode();
  }
}
class InventoryManager {
  private ArrayList<Collectable> collectables;
  private ArrayList<Collectable> markedForDeathCollectables;

  public InventoryManager() {
    collectables = new ArrayList<Collectable>();
    markedForDeathCollectables = new ArrayList<Collectable>();
  }

  public void addCollectable(Collectable collectable) {
    collectables.add(collectable);
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
      image(gameObjectImage, x+10, 30, 40, 40);
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
    for(Collectable c : collectables) {
       stroke(255);
      fill(0, 55);
      rect(x, 0, 100, 100);
      x += 100;
    }
  }
}
class MoveToSceneObject extends GameObject {

  private String nextSceneIdentifier;
  private boolean moveBack;

  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, boolean moveBack) {
    this(identifier, x, y, owidth, oheight, "", moveBack);
  }

  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, boolean moveBack) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.moveBack = moveBack;
  }

  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, String nextSceneIdentifier) {
    this(identifier, x, y, owidth, oheight, "", nextSceneIdentifier);
  }

  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, String nextSceneIdentifier) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.nextSceneIdentifier = nextSceneIdentifier;
    this.moveBack = false;
  }

  @Override
    public void mouseClicked() {
    if (mouseIsHovering) {
      if (moveBack) {
        sceneManager.goToPreviousScene();
      } else {
        try {
          sceneManager.goToScene(nextSceneIdentifier);
        } 
        catch(Exception e) { 
          println(e.getMessage());
        }
      }
    }
  }
  
  
  

}
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
class Scene {
  public String sceneName;
  private PImage backgroundImage;
  private ArrayList<GameObject> gameObjects;

  private ArrayList<GameObject> recentlyAddedGameObjects;
  private ArrayList<GameObject> markedForDeathGameObjects;

  public Scene(String sceneName, String backgroundImageFile) {
    this.sceneName = sceneName;
    this.backgroundImage = loadImage(backgroundImageFile);
    gameObjects = new ArrayList<GameObject>();
    markedForDeathGameObjects = new ArrayList<GameObject>();
    recentlyAddedGameObjects = new ArrayList<GameObject>();
  }

  public void addGameObject(GameObject object) {
    recentlyAddedGameObjects.add(object);
  }

  public void removeGameObject(GameObject object) {
    markedForDeathGameObjects.add(object);
  }

  public void updateScene() {
    if (markedForDeathGameObjects.size() > 0) {
      for (GameObject object : markedForDeathGameObjects) {
        gameObjects.remove(object);
      }
      markedForDeathGameObjects  = new ArrayList<GameObject>();
    }
    if (recentlyAddedGameObjects.size() > 0) {
      for (GameObject object : recentlyAddedGameObjects) {
        gameObjects.add(object);
      }
      recentlyAddedGameObjects  = new ArrayList<GameObject>();
    }
  }

  public void draw(int wwidth, int wheight) {
    image(backgroundImage, 0, 0, wwidth, wheight);
    for (GameObject object : gameObjects) {
      object.draw();
    }
  }

  public void mouseMoved() {
    for (GameObject object : gameObjects) {
      object.mouseMoved();
    }
  }

  public void mouseClicked() {
    for (GameObject object : gameObjects) {
      object.mouseClicked();
    }
  }

  public String getSceneName() {
    return this.sceneName;
  }
}



class SceneManager {
  private HashMap<String, Scene> scenes;
  private Stack<Scene> scenesStack;

  public SceneManager() {
    scenes = new HashMap<String, Scene>();
    scenesStack = new Stack<Scene>();
  }

  public void addScene(Scene scene) {
    scenes.put(scene.getSceneName(), scene);
    if (scenesStack.size() == 0)
    {
      scenesStack.push(scene);
    }
  }

  public void goToScene(String sceneName) throws Exception {
    if (scenes.containsKey(sceneName)) {
      scenesStack.push(scenes.get(sceneName));
      cursor(ARROW);
    } else {
      throw new Exception("Scene not found with name: "+ sceneName + "." + 
        "Make sure it was added to the sceneManager.");
    }
  }

  public void goToPreviousScene() {
    scenesStack.pop();
  }

  public Scene getCurrentScene() {
    return scenesStack.peek();
  }
}
class StoryBox extends GameObject {
  String image;
  PImage gameObjectImage;
  int x;
  int y;
  int posX = 0;
  int posY = 550;
  
  int rectY;
  int i = 0;


  int owidth;
  int oheight;

  boolean dialogShow;

  String[] asd;
  int currentText = 0;

  float nextButtonX = 1169;
  float nextButtonY = 632;
  float nextButtonW = 80;
  float nextButtonH = 50;
  String storyText;
  public String[] textT;
  PImage gameObjectImageFile;

  

  public StoryBox(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, String[] text ) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.gameObjectImageFile = loadImage(gameObjectImageFile);
    this.textT = text;
  }



  public void draw() {

    image(gameObjectImageFile, x, y, owidth, oheight);
    if (mouseIsHovering && mouseWentDown)
    {
      dialogShow = true;      
    }

    if(dialogShow == true) {
        if (i == textT.length) {
          dialogShow = false;
          i = 0;
        } else {
          storyText = getText(i);
          println(i);
          rectY= 600;
          fill(0);
          rect(0, rectY, 1280, 300);
          fill(255);
          text(storyText, 20, 620);
          if(i < textT.length) {
            drawNext();
          } else if (i == (textT.length - 1)) {
            rect(nextButtonX, nextButtonY, nextButtonW, nextButtonH, 45);
            fill(0);
            text("CLOSE", 1192, 660);
          }            
    }
    }
  }
    
  

 
  
  public String getText(int i) {
    return textT[i];
  }
  
  public void mouseClicked() {
    if(mouseX >= nextButtonX && mouseX <= nextButtonX + nextButtonW && mouseY >= nextButtonY && mouseY <= nextButtonY + nextButtonH && (i < textT.length)) {
          i++;
    }
  }
  
  public void drawNext() {
    rect(nextButtonX, nextButtonY, nextButtonW, nextButtonH, 45);
    fill(0);
    text("NEXT!", 1192, 660);
  }
}
class TextObject extends GameObject {
  private String text;
  private boolean displayText;
  private float textWidth;
  private float textHeight;
  public TextObject(String identifier, int x, int y, int owidth, 
    int oheight, String gameObjectImageFile, String text) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.text = text;
    displayText = false;
    calculateTextArea(); //Automatically calculates the area 
    //necessary to display the entire text.
  }
  @Override
    public void draw() {
    super.draw();
    if (displayText) {
      fill(255);
      rect(this.x, this.y, textWidth + 30, textHeight, 8);
      fill(0);
      text(text, this.x + 15, this.y + 15, textWidth, textHeight);
    }
  }
  @Override
    public void mouseClicked() {
    displayText = false;
    if (mouseIsHovering) { 
      displayText = true;
    }
  }

  public void calculateTextArea() {
    textWidth = textWidth(text);
    float remaining = textWidth - 300;
    textWidth = (textWidth > 300) ? 300 : textWidth;
    textHeight = 50;
    while (remaining > 300)
    {
      textHeight += 30;
      remaining -= 300;
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "assignment_6_4_1_point_and_click_framework" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
