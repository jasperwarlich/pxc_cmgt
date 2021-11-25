import processing.video.*;
public boolean play = false;
class Scene {
  public String sceneName;
  private PImage backgroundImage;
  private ArrayList<GameObject> gameObjects;

  private ArrayList<GameObject> recentlyAddedGameObjects;
  private ArrayList<GameObject> markedForDeathGameObjects;
  private ArrayList<ReplaceImage> images;
  float i = 100f;
  int timer = 0;
  RequireObject treasure;
  boolean videoPlaying = false;
  SoundFile musicFile;
  
<<<<<<< HEAD
  



  public Scene(String sceneName, String backgroundImageFile, SoundFile pMusicFile) {
=======
  public Scene(String sceneName, String backgroundImageFile) {
>>>>>>> 5c9b05669248e802a1f7df462734dfbdbca073f4
    this.sceneName = sceneName;
    this.backgroundImage = loadImage(backgroundImageFile);
    gameObjects = new ArrayList<GameObject>();
    markedForDeathGameObjects = new ArrayList<GameObject>();
    recentlyAddedGameObjects = new ArrayList<GameObject>();
<<<<<<< HEAD
    this.musicFile = pMusicFile;
  }

  public Scene(String sceneName, String backgroundImageFile) {
    this.sceneName = sceneName;
    this.backgroundImage = loadImage(backgroundImageFile);
    gameObjects = new ArrayList<GameObject>();
    markedForDeathGameObjects = new ArrayList<GameObject>();
    recentlyAddedGameObjects = new ArrayList<GameObject>();
  }
  
  public void playBGMusic() {
    if(sceneManager.getCurrentScene().sceneName == sceneName) {
      musicFile.play();
    }
    
  }
  
  public void setup() {
    if(videoPlaying) {
      clear();
    }
  }
  

  
=======
  }
>>>>>>> 5c9b05669248e802a1f7df462734dfbdbca073f4

  public void addGameObject(GameObject object) {
    recentlyAddedGameObjects.add(object);
  }

  public void addImage(ReplaceImage image) {
    images.add(image);
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
<<<<<<< HEAD
    
      image(backgroundImage, 0, 0, wwidth, wheight);
    for (GameObject object : gameObjects) {
      object.draw();
    }
=======
    if(videoPlaying) {
      clear();
    } else {
    image(backgroundImage, 0, 0, wwidth, wheight);
    for (GameObject object : gameObjects) {
      object.draw();
    }     
    //if (sceneName == "sailing_cutscene_back") { 
    //  last.play();
    //  last.read();
    //  println(last.time(), last.duration());
    //  if(last.time() == 6.7) {
    //    videoPlaying = false;
    //    try {
    //      sceneManager.goToScene("endingscreen");
    //    } 
    //    catch(Exception e) { 
    //      println(e.getMessage());
    //    }      }
      
    //} else {
    //  play = false;
    //}
    //if(last.time() == last.duration()) {
    //    println("Video is over");
    //    videoPlaying = false;
      //}
>>>>>>> 5c9b05669248e802a1f7df462734dfbdbca073f4
    
   
    
    
      //play = true;
    
<<<<<<< HEAD
=======
      //play = true;
    } 
>>>>>>> 5c9b05669248e802a1f7df462734dfbdbca073f4
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
  void movieEvent(Movie m) {
    m.read();
  }
}
