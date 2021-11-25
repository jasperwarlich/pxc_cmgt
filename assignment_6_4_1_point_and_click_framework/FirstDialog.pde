class FirstDialog extends GameObject {
  String image;
  PImage gameObjectImage;
  int x;
  int y;
  int posX = 0;
  int posY = 550;

  int rectY;
  int i = 0;

  int b = 0;

  int owidth;
  int oheight;

  boolean dialogShow = true;

  float nextButtonX = 1169;
  float nextButtonY = 632;
  float nextButtonW = 80;
  float nextButtonH = 50;
  String storyText;
  public String[] textT;
  PImage gameObjectImageFile;
  ArrayList<RequireObject> item;
  String identifier;
  PImage notFound = loadImage("redcross.png");
  PImage found = loadImage("check.png");
  boolean dontShowObjs = true;
  PImage captain1 = loadImage("captain_talking.png");
  
  boolean isObjective;


  //public FirstDialog(String identifier, int x, int y, int owidth, int oheight, String[] text, ArrayList<RequireObject> item ) {
  //  super(identifier, x, y, owidth, oheight);
  //  this.identifier = identifier;
  //  this.x = x;
  //  this.y = y;
  //  this.owidth = owidth;
  //  this.oheight = oheight;
  //  this.textT = text;
  //  this.item = item;
  //}
  
    public FirstDialog(String identifier, int x, int y, int owidth, int oheight, String[] text, ArrayList<RequireObject> item) {
    super(identifier, x, y, owidth, oheight);
    this.identifier = identifier;
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.textT = text;
    this.item = item;
  }
   public FirstDialog(String identifier, int x, int y, int owidth, int oheight, String[] text) {
    super(identifier, x, y, owidth, oheight);
    this.identifier = identifier;
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.textT = text;
  }
  
   public FirstDialog(String identifier, int x, int y, int owidth, int oheight, String[] text, ArrayList<RequireObject> item, boolean objective) {
    super(identifier, x, y, owidth, oheight);
    this.identifier = identifier;
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.textT = text;
    this.item = item;
    this.isObjective = objective;
  }

  void draw() {
    noStroke();
    if (dialogShow == true) {
      if (i == textT.length) {
        dialogShow = false;
        i = 0;
      } else {
        textSize(20);
        storyText = getText(i);
        rectY= 590;
        fill(0);
        rect(0, rectY, 1280, 300);
        fill(255);
        text(storyText, 20, 620);
        if (i < textT.length) {
          drawNext();
        } else if (i == (textT.length - 1)) {
          rect(nextButtonX, nextButtonY, nextButtonW, nextButtonH, 45);
          fill(255);
          textSize(16);
          text("CLOSE", 1192, 660);
        }
        if (i == 3) {
          sceneManager.getCurrentScene().backgroundImage = captain1;
        }
      }
    }
    
    if(dialogShow == false && identifier == "dialog1" || isObjective) {
      dontShowObjs = false;
      
      if(sceneManager.getCurrentScene().getSceneName() == "night") {

      try {
          sceneManager.goToScene("strandedIsland");
        } 
        catch(Exception e) { 
          println(e.getMessage());
        }
      }
             
       if(sceneManager.getCurrentScene().getSceneName() == "strandedIsland") {
      fill(0);
      rect(1100,25,150,300,28);
      fill(255);
      textSize(14);
      text("Find the missing \nparts (indicated\nwith red) and \ninteract on the ship", 1110, 55);
        
      
      if(item.get(0).isUsed == false) {
        image(notFound,1110,140,25,25);
        text("Front Piece", 1150, 155);
      } else if(item.get(0).isUsed == true) {
        image(found,1110,140,25,25);
        text("Front Piece", 1150, 155);
      }
      
      if(item.get(1).isUsed == false) {
        image(notFound,1110,175,25,25);
        text("Main Mast", 1150, 190);
      } else if(item.get(1).isUsed == true) {
        image(found,1110,175,25,25);
        text("Main Mast", 1150, 190);
      }
      
      if(item.get(2).isUsed == false) {
        image(notFound,1110,210,25,25);
        text("Pirate Flag", 1150, 220);
      } else if(item.get(2).isUsed == true) {
        image(found,1110,210,25,25);
        text("Pirate Flag", 1150, 220);
      }
      
      if(item.get(3).isUsed == false) {
        image(notFound,1110,245,25,25);
        text("Wood Piece", 1150, 260);
        
      } else if(item.get(3).isUsed == true) {
        image(found,1110,245,25,25);
        text("Wood Piece", 1150, 260);
      }
       } 
        
        
       if(item.get(0).isUsed == true && item.get(1).isUsed == true && item.get(2).isUsed == true && item.get(3).isUsed == true) {
      try {
          sceneManager.goToScene("repairedShip");
          item.get(0).isUsed = false;
          item.get(1).isUsed = false;
          item.get(2).isUsed = false;
          item.get(3).isUsed = false;
        } 
        catch(Exception e) { 
          println(e.getMessage());
        }
       }
       
       if(sceneManager.getCurrentScene().getSceneName() == "repairedShip") {
          fill(0);
      rect(900,25,300,100,28);
      fill(255);
      textSize(14);
      text("Go to the bar and talk to the bartender", 910, 80);
       }
      
      
    }
    
    
   
    
    

  }

  String getText(int i) {
    return textT[i];
  }

  void mouseClicked() {
    if (mouseX >= nextButtonX && mouseX <= nextButtonX + nextButtonW && mouseY >= nextButtonY && mouseY <= nextButtonY + nextButtonH && (i < textT.length)) {
      i++;
    }
  }

  void drawNext() {
    rect(nextButtonX, nextButtonY, nextButtonW, nextButtonH, 45);
    fill(0);
    textSize(16);
    text("NEXT!", 1192, 660);
  }
} 
