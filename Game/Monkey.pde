abstract class Monkey{
  protected int posx, posy, dartCount;
  protected int fireRate, damage, speed, projType, size, range, pierce;
  protected int timeFired = 1000;
  protected int placingTimer = 0;
  protected color c; 
  protected float lastAngle = -PI/2;
  protected boolean highlight = false;
  protected int[][] upgradeCosts = {{0,0,0,0},{0,0,0,0}};
  protected String[][] upgradeNames = {{"","","",""},{"","","",""}};
  private int upgrade1Prog = 0;
  private int upgrade2Prog = 0;
  protected String name;
  PImage monkeyImage;
  
  
  public void update(){
    timeFired ++;
    Bloons b = checkTargets();
    if (b != null){
      lastAngle = shoot(b);
    }
    for (int i = 0; i < dartCount; i ++){
      Dart dart = (Dart)DartList.get(i);
      dart.update();
    }
    drawMonkey(posx, posy);
  }
  public void displayUpgrades(){
    fill(150, 100, 50);
    rect(1515, 15, 270, 90);
    rectMode(CENTER);
    textSize(30);
    fill(255);
    text(name, 1515 + 135, 15 + 55);
    rectMode(CORNER);
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
    text(shortestDist, 20,20);
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
  
  protected float shoot(Bloons b){
    if (timeFired >= fireRate){
      int bloonx = b.getX() - posx;
      int bloony = b.getY() - posy;
      timeFired = 0;
      DartList.add(new Dart(bloonx, bloony, posx, posy, speed, damage, projType, pierce));
      dartCount ++;
      return atan2(bloony, bloonx);
    }
    return lastAngle;
  }
  
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
}
