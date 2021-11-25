class VideoPlay extends GameObject {
  String filename;
  PApplet p;
  RequireObject object;
  
  public VideoPlay(String identifier, int x, int y, int owidth, int oheight, String filename, PApplet p, RequireObject object) {
    super(identifier,x,y,owidth,oheight);
    this.filename = filename;
    this.p = p;
    this.object = object;
  }
  
  
  public void draw() {
    if(object.play) {
        Movie movie = new Movie(p, filename);
        movie.play();
        image(movie,0,0);
    }
    
  }
}
