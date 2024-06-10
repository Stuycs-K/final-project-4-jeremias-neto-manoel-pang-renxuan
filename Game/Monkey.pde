abstract class Monkey{
  
  //monkey info (location, damage, color, angle, highlight)
  protected int posx, posy, dartCount;
  protected int fireRate, damage, speed, projType, size, range, pierce;
  protected int timeFired = 1000;
  protected int placingTimer = 0;
  protected color c; 
  protected float lastAngle = -PI/2;
  protected boolean highlight = false;
  private boolean upgradeMode = false;
  protected int lifetime;
  protected int projSize;
  protected int sellCost;
  
  //upgrade information
  protected int[][] upgradeCosts = {{0,0,0,0},{0,0,0,0}};
  protected String[][] upgradeNames = {{"","","","",""},{"","","","",""}};
  int[][] upgradePierce = {{0,0,0,0},{0,0,0,0}};
  int[][] upgradeDamage = {{0,0,0,0},{0,0,0,0}};
  int[][] upgradeProjectile = {{0,0,0,0},{0,0,0,0}};
  int[][] upgradeAttacksSpd = {{0,0,0,0},{0,0,0,0}};
  int[][] upgradeRange = {{0,0,0,0},{0,0,0,0}};
  int[][] upgradeProjSpeed = {{0,0,0,0},{0,0,0,0}};
  int[][] upgradeProjSize = {{0,0,0,0},{0,0,0,0}};
  
  //upgrade stuff
  public void cashmonkey(int cost){
    sellCost = cost;
  }
  
  public void sell(){
    monkeyList.remove(this);
    money += sellCost * .5;
    highlight = false;
    upgradeMonkey = null;
    placingMonkey = null;
  }
    
  public void upgrade1(){ // side is 0 or 1 (0 for path 1, 1 for path 2)
    fireRate -= upgradeAttacksSpd[0][upgrade1Prog];
    damage += upgradeDamage[0][upgrade1Prog];
    speed += upgradeProjSpeed[0][upgrade1Prog];
    projType = upgradeProjectile[0][upgrade1Prog];
    range += upgradeRange[0][upgrade1Prog];
    pierce += upgradePierce[0][upgrade1Prog];
    projSize += upgradeProjSize[0][upgrade1Prog];
    money -=upgradeCosts[0][upgrade1Prog];
    sellCost += upgradeCosts[0][upgrade1Prog];
    upgrade1Prog ++;
  }
  
  public void upgrade2(){ // side is 0 or 1 (0 for path 1, 1 for path 2)
    fireRate -= upgradeAttacksSpd[1][upgrade2Prog];
    damage += upgradeDamage[1][upgrade2Prog];
    speed += upgradeProjSpeed[1][upgrade2Prog];
    projType = upgradeProjectile[1][upgrade2Prog];
    range += upgradeRange[1][upgrade2Prog];
    pierce += upgradePierce[1][upgrade2Prog];
    projSize += upgradeProjSize[1][upgrade2Prog];
    money -=upgradeCosts[1][upgrade2Prog];
    sellCost += upgradeCosts[1][upgrade2Prog];
    upgrade2Prog ++;
  }

  
  public boolean canUpgrade1(){
    if (upgrade2Prog >= 3&&upgrade1Prog >= 2)return false;
    if (upgrade1Prog >= 4)return false;
    if (upgradeCosts[0][upgrade1Prog] > money)return false;
    return true;
  }

  public boolean canUpgrade2(){
    if (upgrade1Prog >= 3&&upgrade2Prog >= 2)return false;
    if (upgrade2Prog >= 4)return false;
    if (upgradeCosts[1][upgrade2Prog] > money)return false;
    return true;
  }
  
  //upgrade progression
  protected int upgrade1Prog = 0;
  protected int upgrade2Prog = 0;
  
  //monkey information
  protected String name;
  PImage monkeyImage;
  PImage sidebarImage;
  
  PImage Base;
  PImage P11;
  PImage P12;
  PImage P13;
  PImage P14;
  PImage P23;
  PImage P24;
  
  
  public void update(){
    if(upgrade1Prog ==1|| upgrade2Prog == 1){
      monkeyImage = P11;
    }
    if(upgrade1Prog ==2|| upgrade2Prog == 2){
      monkeyImage = P12;
    }
    if(upgrade1Prog ==3){
      monkeyImage = P13;
    }
    if(upgrade2Prog ==3){
      monkeyImage = P23;
    }
    if(upgrade1Prog ==4){
      monkeyImage = P14;
    }
    if(upgrade2Prog ==4){
      monkeyImage = P24;
    }
    timeFired ++;
    Bloons b = checkTargets();
    if (b != null){
      int bloonx = b.getX();
      int bloony = b.getY();
      lastAngle = shoot(bloonx, bloony);
    }
    drawMonkey(posx, posy);
  }
  
  public void displayUpgrades(){
    
    //menu stuff
    fill(150, 100, 50);
    rect(1515, 15, 270, 90);
    rectMode(CENTER);
    textSize(30);
    fill(255);
    text(name, 1515 + 135, 15 + 55);
    rectMode(CORNER);
    fill(133, 228, 255);
    rect(1515, 130, 270, 350);
    fill(150, 100, 50);
    rect(1515, 495, 270, 90);
    rect(1515, 650, 270, 90);
    fill(255,0,0);
    rect(1515, 895, 270, 90);
    fill(255);
    rectMode(CENTER);
    text("Sell: $ " + ((int)(sellCost * .5)), 1515 + 135, 895 + 55);
    rectMode(CORNER);
    PImage display = sidebarImage.copy();
    display.resize(0,230);
    image(display, 1550, 170);
    //text for upgrade
    
    text(upgradeNames[0][upgrade1Prog], 1650, 540);
    if(upgrade1Prog != 4){
      text(""+upgradeCosts[0][upgrade1Prog], 1650, 570);
    }
    text(upgradeNames[1][upgrade2Prog], 1650, 540+150);
    if(upgrade2Prog != 4){
      text(""+upgradeCosts[1][upgrade2Prog], 1650, 570+150);
    }
    //upgrade progression circles
    
    ellipseMode(CENTER);
    fill(0);
    if(upgrade1Prog >=2){
      fill(255);
    }
    circle(1625, 540+60, 10);
    fill(0);
    if(upgrade1Prog >=3){
      fill(255);
    }
    circle(1675, 540+60, 10);
    fill(0);
    if(upgrade1Prog >=1){
      fill(255);
    }
    circle(1575, 540+60, 10);
    fill(0);
    if(upgrade1Prog >=4){
      fill(255);
    }
    circle(1725, 540+60, 10);
    
    //second//////////////////////////////////////////////
    
    fill(0);
    if(upgrade2Prog >=2){
      fill(255);
    }
    circle(1625, 570+40+150, 10);
    fill(0);
    if(upgrade2Prog >=3){
      fill(255);
    }
    circle(1675, 570+40+150, 10);
    fill(0);
    if(upgrade2Prog >=1){
      fill(255);
    }
    circle(1575, 570+40+150, 10);
    fill(0);
    if(upgrade2Prog >=4){
      fill(255);
    }
    circle(1725, 570+40+150, 10);
  }
  public boolean placing(){
    highlight = true;
    rectMode(CENTER);
    textSize(30);
    fill(255);
    text(name, 1515 + 135, 15 + 55);
    rectMode(CORNER);
    placingTimer += 1;
    int shortestDist = 1000;
    drawMonkey(mouseX, mouseY);
    if (placingTimer >= 30){
      for (Guiders roadBit : guide){
        if (dist(roadBit.getX(), roadBit.getY(), mouseX, mouseY) < shortestDist){
          shortestDist = (int)(dist(roadBit.getX(), roadBit.getY(), mouseX, mouseY)+1);
        }
      }
      for (Monkey monkey : monkeyList){
        if (dist(monkey.getX(), monkey.getY(), mouseX, mouseY) < shortestDist){
          shortestDist = (int)(dist(monkey.getX(), monkey.getY(), mouseX, mouseY)+1);
        }
      }
    }
    return ((shortestDist > size/1.6 + 25 && mousePressed));
  }
  
  protected Bloons checkTargets(){
    for (Bloons b : bloons){
      if (dist(b.getX(), b.getY(), posx, posy) <= range){
        return b;
      }
    }
    return null;
  }
  
  abstract float shoot(int x, int y);
  
  protected void drawMonkey(int posX, int posY){
    fill(200, 100, 10);
    //circle(posX, posY, size);
    pushMatrix();
    translate(posX, posY);
    rotate(lastAngle+PI/2);
    translate(-monkeyImage.width/2, -monkeyImage.height/2);
    image(monkeyImage, 0, 0);
    popMatrix();
    if (highlight){
      stroke(1);
      noFill();
      circle(posX, posY, range*2-10);
      noStroke();
    }
    fill(255);
  }
  public void setX(int x){
    posx = x;
  }
  public void setY(int y){
    posy = y;
  }
  public int getX(){
    return posx;
  }
  public int getY(){
    return posy;
  }
  public void swapMode(){
    highlight = !highlight;
  }
  public void setModeH(){
    highlight = true;
  }
  public void setModeNH(){
    highlight = false;
  }
  public boolean getMode(){
    return highlight;
  }
  public int getSize(){
    return size;
  }
  public String getName(){
    return name;
  }
  public ArrayList<Dart> getDartList(){
    return DartList;
  }
  public int getProg1(){
    return upgrade1Prog;
  }
  public int getProg2(){
    return upgrade2Prog;
  }

  public boolean getUpgradeMode(){
    return upgradeMode;
  }
}
