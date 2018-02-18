class Bubbles implements Tankable {

  protected PVector location;
  protected PVector speed;
  int bubRadius;
   FishTank ft;
  
  
  Bubbles (FishTank T){
     this.ft = T;
   location = new PVector(random(ft.getX(), (ft.getLength()-40)), ft.getWidth());
   bubRadius = (int) random(20,40);
  }// Bubbles Constructor
  
  Bubbles (FishTank T, float x, float y){
     this.ft = T;
   location = new PVector(x,y);
   bubRadius = (int) random(1,10);
  }// Bubbles Constructor


  void show() {
    stroke(255);
   noFill();
    ellipse(location.x, location.y, bubRadius, bubRadius);
  }//shows the bubbles

  void move() {
  
      location.y--;
    
  }//moves the bubbles up the tank
  
 public void setRadius(int r){
   bubRadius=r;
 }
 public void tankClicked(){
 }
  
  public void update(){
    show();
    move();
  }//updates the bubbles movement and appearance
public boolean hasCollision(Tankable t){
  return false;
}//nothing for this class
public float getRadius() { return bubRadius; }//returns bubbles radius
public float getX() { return location.x;}//returns bubbles x-coordinate
public float getY() {return location.y;}//returns bubbles y-coordinate
public boolean alive(){return false;}
public color getColor() { return color(0); }
public int getGender() {return -1;}
public boolean tryToEat(Tankable t){return false;}
  
}// Bubbles Class
