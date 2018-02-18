/*
 FishTales Project
 Eric Thoman 3/20/16
 -When you tap the tank, the fish move in directions opposite the mouse click, if they weren't already
 -The fish have tails that change orientation depending on the fish's movement.
 -The goldfish change directions when they hit each other
 -Whales and Piranhas eat Goldfish
 -Fish die if they have too much or too little weight
 -Fish die if they get too old
 -Pvector is implemented
 -When piranhas and whales collide the bigger one eats the smaller one.
 -When two piranhas collide the bigger one eats the smaller one.
 -Abstract fish class
 -Random maxweight, maxspeed, and maxage based on random gaussian
 -Random Gaussian is used for bubble placement when fish of the same type collide or when the tank is tapped
 -Tankable interface
 -10% chance for fish of the same type to reproduce on collision
 */


FishTank theTank;
color blue = color(0, 0, 255);
color red = color(255, 0, 0);
color green = color(0, 255, 0);
color yellow = color(255, 255, 0);
color purple = color(83, 57, 237);
color cyan = color(0, 128, 128);
color grey = color(128);
int count=0;


void setup() {
  size(800, 600);
  theTank= new FishTank("First", 0,0,600,800);
}

void draw() {
  background(113, 244, 255);
  theTank.show();
  theTank.updateAll();
  fill(255);
  rect(600, 0, 200, 600);
  //goldfishbutton:
  fill(blue);
  rect(605, 5, 190, 50);
  //foodbutton:
  fill(red);
  rect(605, 225, 190, 50);
  //piranha
  fill(yellow);
  rect(605, 60, 190, 50);
  //whale
  fill(green);
  rect(605, 115, 190, 50);
  fill(purple);
  rect(605, 280, 190, 50);
  fill(cyan);
  rect(605, 170, 190, 50);
  fill(grey);
  rect(605, 335, 190, 50);
  fill(100);
  text("Goldfish", 675, 30);
  text("Piranha", 675, 85);
  text("Whale", 675, 140);
  text("Toroidalfin", 675, 195);
  text("Food", 675, 250);
  text("Poison", 675, 305);
  text("Clean The Tank", 675, 360);
  
  count++;
    if(count%50==0){
    theTank.add(new Bubbles(theTank));
    }
}

void mouseClicked() {

  color x = get (mouseX, mouseY);
  if (x == blue) {
    theTank.add(new Goldfish(theTank));
  }

  if (x==green) {
    theTank.add(new Whale(theTank));
  }

  if (x==yellow) {
    theTank.add(new Piranha(theTank));
  }
  if (x==cyan) {
    theTank.add(new Toroidalfin(theTank));
  }

  if (x == red) {
    for (int i = 0; i<10; i++) {
      theTank.add(new Pellet(theTank,1));
    }
  }
  if (x == purple) {
    for (int i = 0; i<10; i++) {
      theTank.add(new Pellet(theTank,2));
    }
  }
  if (x==grey) {
    theTank.cleanTheTank();
  }
  theTank.taptheTank();
}

