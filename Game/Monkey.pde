abstract class Monkey{
  protected int posx, posy, dartCount;
  protected int fireRate, damage, speed,projType, size, range;
  ArrayList<Dart> DartList = new ArrayList();
  protected int timeFired = 1000;
  
  public void update(){
    drawMonkey();
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
  
  protected void drawMonkey(){
    fill(200, 100, 10);
    circle(posx, posy, size);
    stroke(0);
    noFill();
    circle(posx, posy, range*2);
    noStroke();
    fill(255);
  }
}
