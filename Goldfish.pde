class Goldfish extends Fish {
  Goldfish(FishTank f) {
    super(f);
    name = "Goldfish";
    skin = color(random (255), random(255), 0);
    maxWeight = 30+randomGaussian()*30*.25;
    maxSpeed=3+randomGaussian()*3*.25;
    maxAge=2000+(int)(randomGaussian()*2000*.25);
    weight = 10;
  }
  public void move() {
    this.location.x += this.speed.x;
    this.location.y += this.speed.y;
    if (age>=maxAge || weight>=maxWeight || weight<4) dead = true;
    if (dead) {
      speed.x = 0;
      this.location.x += speed.x;
      if(location.y>2)
      this.location.y -= 1;
      this.weight-=.01;
      this.age--;
      fill(0);
      ellipse(location.x+signX*(weight/(3)), location.y+signY*(weight/(3)), weight/6, weight/6);
    } else {
      if (this.location.x+this.weight/2>600 && signX ==1){
        speed.x = random (-3, -1);
      }
      if(this.location.x-this.weight/2<0 && signX == -1){
       speed.x = random(1,3);
      } 
      if (this.location.y+this.weight/2>600 && signY ==1) {
        speed.y = random(-3, -1);
      }
      if(this.location.y-this.weight/2<0 && signY ==-1){
        speed.y = random(1,3);
      }
      if(age%50==0){
        speed.x=random(-3.0, 3.0);
        speed.y=random(-3.0, 3.0);
      }
      fill(255);
      ellipse(location.x+signX*(weight/(3)), location.y+signY*(weight/(3)), weight/6, weight/6); //eyes
    }

    float tailX = location.x - weight * .35 *signX;
    float tailY = location.y - weight * .35*signY;
    float addX = weight/2 * .966;
    float addY = weight/2 * .259;
 triangle(tailX, tailY, tailX - addX *signX, tailY -signY* addY, tailX - addY *signX, tailY - addX *signY);
 }//move()
 
 public boolean tryToEat(Tankable p) {
    if (p instanceof Pellet && this.hasCollision(p) && this.alive()) {
      if (p.getColor()==color(255, 0, 0)) {
        weight-=5;
        return true;
      }//decreases the weight of the GoldFish
      else if (p.getColor()==color(0, 255, 0)) {
        weight+=5;
        return true;
      }//increases the weight of the GoldFish
    }
    if (p instanceof Goldfish && !(p instanceof Toroidalfin) && this.hasCollision(p)  && this.alive() && p.alive()) {
      speed.x=-1.05 * speed.x;
      speed.y=-1.05 * speed.y;
      for(int i = 0; i<5; i++){
        theTank.add(new Bubbles(theTank, location.x+randomGaussian()*10, location.y+randomGaussian()*10));
      }

      if (this.getGender() ==0 && p.getGender() == 1  && collision==0 || p.getGender() ==0 && this.getGender() == 1 && collision==0) {
        collision++;
        int picker = (int) random(0, 10);
        if (picker==0) {
          ft.add(new Goldfish(ft));
          return false;
        }
        else { 
          return false;
        }
      }
      else return false;
    }// adds a new GoldFish if two GoldFish mated
    return false;
  }// tryToEat method
}

