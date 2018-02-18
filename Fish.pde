abstract class Fish implements Tankable{
  protected String name;
  protected float maxSpeed;
  protected int signX, signY;
  protected PVector location;
  protected PVector speed;
  protected color skin, outline;
  protected int age;
  protected int gender;
  protected float collision = 0;
  protected float centerDistance;
  protected float sumRadii;
  protected float weight;
  protected float maxWeight;
  protected int maxAge;
  protected boolean dead;
  FishTank ft;


  Fish(FishTank f) {
    this.ft=f;
    this.speed= new PVector(random(-1, 1),random(-1, 1));
    this.location= new PVector(random(100,500),random(100,500));
    this.skin=color(random(255), 0, 0);
    this.outline=color(0);
    this.maxSpeed=5;
    this.weight=10;
    this.age = 0;
    this.maxAge = 5000;
    this.maxWeight = 50;
    this.gender = (int) random(0, 2);
  }
  Fish(String name) {
    this.name=name;
    this.speed.x=random(-1, 1);
    this.speed.y=random(-1, 1);
    this.location.x=height/2;
    this.location.y=width/2;
    this.location=new PVector(location.x, location.y);
    this.skin=color(random(255), 0, 0);
    this.outline=color(0);
    this.maxSpeed=5;
    this.weight=10;
    this.age = 0;
    this.maxAge = 5000;
    this.maxWeight = 50;
    this.gender = (int) random(0, 2);
  }//fish constructor
  public float getX() {
    return location.x;
  }
  public float getY() {
    return location.y;
  }
  public float getWeight() {
    return this.weight;
  }
  public float getRadius() {
    return this.weight/2;
  }
  public void setRadius(int r) {
    this.weight=2*r;
  }
  public boolean alive(){
    if(dead) return false;
    else return true;
  }
  public PVector getSpeed(){
    return speed;
  }
  public void bump() {
    if (!dead) {
      this.speed.x*=-1;
      this.speed.y*=-1;
    }
  }
  public int getGender() {
    return gender;
  }
  public color getColor() {
    return color(0);
  }
  public void update() {
    show();
    move();
    age++;
    weight+=.01;
  }//update

  public void show() {
    fill(skin);
    stroke(outline);
    ellipse(location.x, location.y, weight, weight);
    fill(255);
    if (speed.x<0) { 
      signX=-1;
    } else { 
      signX = 1;
    }

    if (speed.y<0) { 
      signY=-1;
    } else { 
      signY = 1;
    }

    fill(255);
    text(toString(), location.x-5, location.y-5);
  } //show() 

  public int sgn(float f) {
    if (f>0) return 1;
    else if (f<0) return -1;
    else { 
      return 0;
    }
  }//method to determine if fish is moving towards mouse
  public void tankClicked() {
    if (!dead && mouseX<600) {
      speed.x *= -sgn(speed.x)*sgn(mouseX-location.x );
      speed.y *= -sgn(speed.y)*sgn(mouseY-location.y);
    }
  }//method that tells fish to turn around if it is moving towards mouse
 
  public boolean hasCollision(Tankable t) {
    centerDistance = sqrt( sq( t.getX() - this.getX()) + sq(t.getY() - this.getY()));
    sumRadii = this.getRadius() + t.getRadius();
    if (sumRadii > centerDistance) {

      return true;
    }
    else {
      return false;
    }
  }

  public void changeDirection(Fish f) {
    if (!dead) {
      this.speed.x*=-1;
      this.speed.y*=-1;
    }
  }
  abstract boolean tryToEat(Tankable t);
  abstract void move();
  public String toString() { 
    return this.name+"  "+this.age+" frames old. ";
  }
}//class Fish

