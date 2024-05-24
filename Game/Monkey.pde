abstract class Monkey{
  protected int posx, posy, dartCount;
  protected int fireRate, damage, speed,projType, size, range;
  ArrayList<Dart> DartList = new ArrayList();
  protected int timeFired = 1000;
  protected int placingTimer = 0;
  protected color c; 
  
  public void update(){
    drawMonkey(posx, posy);
    timeFired ++;
    Bloons b = checkTargets();
    if (b != null){
      shoot(b);
    }
    for (int i = 0; i < dartCount; i ++){
      Dart dart = (Dart)DartList.get(i);
      dart.update();
    }
  }
  
  public boolean placing(){
    placingTimer += 1;
    boolean canPlace = false;
    drawMonkey(mouseX, mouseY);
    if (placingTimer >= 30){
      if (mousePressed){
        canPlace = true;
        for (int[] roadBit : mapInfo){
          if(mouseX < roadBit[0] + 50 + size && mouseX > roadBit[0] - 50 - size && mouseY < roadBit[1] + 50 + size && mouseY > roadBit[1] - 50 - size){
            canPlace = false;
          }
        }
        if (canPlace == true){
          posx = mouseX;
          posy = mouseY;
        }
      }
    }
    return canPlace;
  }
  
  protected Bloons checkTargets(){
    for (Bloons b : bloons){
      if (dist(b.getX(), b.getY(), posx, posy) <= range){
        return b;
      }
    }
    return null;
  }
  
  protected void shoot(Bloons b){
    if (timeFired >= fireRate){
      timeFired = 0;
      DartList.add(new Dart(b.getX() - posx, b.getY() - posy, posx, posy, speed, damage, projType));
      dartCount ++;
    }
  }
  
  protected void drawMonkey(int posX, int posY){
    fill(200, 100, 10);
    circle(posX, posY, size);
    stroke(0);
    noFill();
    circle(posX, posY, range*2);
    noStroke();
    fill(255);
  }
}
