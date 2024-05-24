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
}
