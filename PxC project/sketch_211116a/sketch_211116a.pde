//This set the background. We will make the String backgroundName changeable later on
PImage background;
Scenes scenes;
String backgroundName = "background.png";
//
void setup() {
  //The size should be == to the background size
  size(900,506);
  background = loadImage(backgroundName);
  scenes = new Scenes(background, backgroundName);
}
void draw() {
  //This sets the current background
  scenes.update();
}
