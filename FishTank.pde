public class FishTank {

  private ArrayList<Tankable> items;
  private int ammoniaLevel;
  private float Length, Width, mx, my;
  private String name;
  private int time;
  private color waterColor = color(113, 244, 255);



  FishTank(String n, float x, float y, float l, float w) {
    items = new ArrayList<Tankable>();
    name = n;
    mx = x;
    my = y;
    Length = l;
    Width = w;
  }// FishTank Constructor

  public float getX() { 
    return this.mx;
  }//gets left of fishtank
  public float getY() { 
    return this.my;
  }//gets top of fishtank
  public float getLength() { 
    return this.Length;
  }//gets right of fishtank
  public float getWidth() { 
    return this.Width;
  }//gets bottom of fishtank

  public boolean add(Tankable t) {
    return items.add(t);
  }//adds an object to the ArrayList items

  public boolean remove(Tankable t) {
    return items.remove(t);
  }//removes an object from the ArrayList items

  public void show() {
    stroke(waterColor);
    fill(waterColor);
    rect(mx, my, Length, Width);
    fill(0, 255, 0, ammoniaLevel/25);
    rect(mx, my, Length, Width);
  }//shows the tank

  
  void taptheTank() {
    for (Tankable t: items)
      t.tankClicked();
      for(int i = 0; i<5; i++){
        theTank.add(new Bubbles(theTank, mouseX+randomGaussian()*10, mouseY+randomGaussian()*10));
      }
  }//bumps all objects

  public int cleanTheTank() {
    ammoniaLevel = 0;

    for (int a = 0; a<items.size(); a++) {
      Tankable t1 = items.get(a);
      if (t1.alive() == false) {
        remove(t1);
        a--;
      }
    }
    return ammoniaLevel;
  }//cleans the tank

  void updateAll() {
    for (Tankable t: items) {
      t.update();
    }

    
    for (int a = 0; a<items.size(); a++) {
      Tankable t1 = items.get(a);
      for (int b = 0; b<items.size(); b++) { 
        Tankable t2 = items.get(b);
        if (t1!=t2) {
          if (t2.tryToEat(t1)==true) {
            remove(t1);
          }
        }
      }
    }

    if (ammoniaLevel/20<120) {
      ammoniaLevel++;
    }
  }//updates the objects in the tank and the tanks ammoniaLevel
}//FishTank Class

