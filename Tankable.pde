interface Tankable {

  public void update();
  public float getRadius();
  public boolean hasCollision(Tankable t);
  public void tankClicked();
  public float getX();
  public float getY();
  public void setRadius(int r);
  public boolean tryToEat(Tankable t);
  public boolean alive();
  public color getColor();
  public int getGender();

}// Tankable Interface

