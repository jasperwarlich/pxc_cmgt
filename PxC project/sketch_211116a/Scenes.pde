class Scenes {
  PImage currentBackground;
  String backgroundName;
  Scenes(PImage pCurrentBackground, String pBackgroundName) {
    currentBackground = pCurrentBackground;
    backgroundName = pBackgroundName;
  }
  
  boolean scene1 = true;
  boolean scene2;
  boolean scene3;
  void update() {
    if(scene1){
    background(currentBackground);
    scene2 = false;
    scene3 = false;
    }else if(scene2){
   //Add different elements in this scene
   //background(currentBackground);
    scene1 = false;
    scene3 = false;
    }else if(scene3){
   //Add different elements in this scene
   //background(currentBackground);
    scene1 = false;
    scene2 = false;
    }
  }
}
