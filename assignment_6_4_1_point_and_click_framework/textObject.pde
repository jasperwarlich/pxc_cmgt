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
      //textSize(13);
      //fill(255);
      //rect(this.x, this.y, textWidth + 30, textHeight, 8);
      //fill(0);
      //textSize(13);      
      //text(text, this.x, this.y + 15, textWidth, textHeight);
      textSize(20);
        //storyText = getText(i);
        int rectY= 590;
        fill(0);
        rect(0, rectY, 1280, 300);
        fill(255);
        text(text, 20, 620);
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
