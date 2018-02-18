class Pellet implements Tankable{
  private color myColor;
  private PVector location;
  private PVector speed;
  private float size;
  private int type;
  FishTank ft;

  Pellet (FishTank f, int t) {
    this.ft=f;
    this.type = t;
    if (this.type==1) myColor = color(0, 255, 0);
    else if (this.type==2) myColor = color(255, 0, 0);
    this.speed=new PVector(0,random(-1, 0));
    this.location = new PVector(random(600), random(100));
    this.size = 6;
  }
  public int getType() { 
    return this.type;
  }
  public float getX() { 
    return this.location.x;
  }
  public float getY() { 
    return this.location.y;
  }
  public float getSize() { 
    return this.size;
  }
  public float getRadius() { 
    return this.size/2;
  }
  public void setRadius(int r) { 
    size=2*r;
  }
  public color getColor(){
    return myColor;
  }
  public boolean alive(){
    return true;
  }
   public boolean hasCollision(Tankable T) {
    return false;
  }
  public int getGender(){
    return -1;
  }
  public void tankClicked(){
  }
  public boolean tryToEat(Tankable T) {
    return false;
  }

  void update() {
    move();
    show();
  }

  public void move() {
    this.location.y-=this.speed.y;
    if (this.location.y>594) {
      this.speed.y = 0;
    }
  }

  public void show() {
    fill(myColor);
    ellipse(location.x, location.y, size, size);
  }
}

