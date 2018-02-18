class Piranha extends Fish {
  Piranha(FishTank f) {
    super(f);
    name = "Piranha";
    skin = color(0, random(150), random (255));
    maxWeight = 50+randomGaussian()*50*.25;
    maxSpeed=2+randomGaussian()*2*.25;
    maxAge=10000+(int)(randomGaussian()*10000*.25);
    weight = 20;
  }
  public void move() {
    this.location.x += this.speed.x;
    this.location.y += this.speed.y;
    if (age>=maxAge || weight>=maxWeight || weight<10) dead = true;
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
        speed.x = random (-2, -1);
      }
      if(this.location.x-this.weight/2<0 && signX == -1){
       speed.x = random(1,2);
      } 
      if (this.location.y+this.weight/2>600 && signY ==1) {
        speed.y = random(-2, -1);
      }
      if(this.location.y-this.weight/2<0 && signY ==-1){
        speed.y = random(1,2);
      }
      if(age%50==0){
        speed.x=random(-2.0, 2.0);
        speed.y=random(-2.0, 2.0);
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
    if ( p instanceof Goldfish && this.hasCollision(p) && this.alive() && p.alive()) {
      weight+=(p.getRadius()*2)/5;
      return true;
    }  // eats a GoldFish
    if ( p instanceof Whale && this.hasCollision(p) && this.alive() && p.alive() && this.getRadius() > p.getRadius()) {
      weight+=(p.getRadius()*2)/5;
      return true;
    }  // eats a smaller whale
    else if (p instanceof Pellet && this.hasCollision(p) && this.alive()) {
      if (p.getColor()==color(255, 0, 0)) {
        weight-=5;
        return true;
      }//decreases the weight of the GoldFish
      else if (p.getColor()==color(0, 255, 0)) {
        weight+=5;
        return true;
      }//increases the weight of the GoldFish
    }
    if (p instanceof Goldfish && !(p instanceof Toroidalfin) && dist(p.getX(), p.getY(), this.getX(), this.getY())<200 &&  this.alive() && p.alive()) { 
      float run=p.getX()- this.getX() ;
      float rise = p.getY() - this.getY() ;
      float distance = sqrt((run*run) + (rise*rise));
      float srise = rise / distance;
      float srun = run/distance;

      this.speed.x = srun * 3;
      this.speed.y = srise * 3;
    }// follows GoldFish and eats them 

    if (p instanceof Piranha &&  this.hasCollision(p)  && this.alive() && p.alive() && this.getRadius()>p.getRadius()) {
      weight+=(p.getRadius()*2)/5;
      return true;
    }// Bigger piranha eats the smaller one


    return false;
  }// tryToEat method
}

