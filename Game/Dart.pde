  public class Dart{
  PVector launch = new PVector(0,0);
  PVector position = new PVector(0,0);
  int damage;
  int projType;
  int pierce;
  int size;
  int lifetime;
  int r;
  int g;
  int b;
  int a = 1000;
  int dType;
  int altCount;
  // 1 = sharp, 2 = all, 3 = bomb
  
  public Dart(float posx, float posy, int launchx, int launchy, int speed, int damage_, int projType_, int pierce_, int lifetime_, int projSize_, int r_, int g_, int b_){
    position.set(launchx, launchy);
    launch.set(posx, posy);
    launch.normalize();
    launch.setMag(speed);
    damage = damage_;
    projType = projType_;
    pierce = pierce_;
    lifetime = lifetime_;
    size = projSize_;
    r = r_;
    g=g_;
    b=b_;
  }
  
  public Dart(int dType_, float posx, float posy, int launchx, int launchy, int speed, int damage_, int projType_, int pierce_, int lifetime_, int projSize_, int r_, int g_, int b_){
    position.set(launchx, launchy);
    launch.set(posx, posy);
    launch.normalize();
    launch.setMag(speed);
    damage = damage_;
    projType = projType_;
    pierce = pierce_;
    lifetime = lifetime_;
    size = projSize_;
    r = r_;
    g=g_;
    b=b_;
    dType = dType_;
    altCount = lifetime_;
  }
  public int dType(){
    return dType;
  }
  
  public Dart(float posx, float posy, int launchx, int launchy, int speed, int damage_, int projType_, int pierce_, int lifetime_, int projSize_, int r_, int g_, int b_, int a_){
    position.set(launchx, launchy);
    launch.set(posx, posy);
    launch.normalize();
    launch.setMag(speed);
    damage = damage_;
    projType = projType_;
    pierce = pierce_;
    lifetime = lifetime_;
    size = projSize_;
    r = r_;
    g=g_;
    b=b_;
    a=a_;
  }
    public boolean update(){
      if(dType != 1){
      lifetime --;
      if (position.x > width || position.x < 0 || position.y > height || position.y < 0|| pierce <= 0 || lifetime <= 0){
        return true;
      }
      fill(r,g,b,a);
      circle(position.x, position.y, size*2);
      position.add(launch);
      fill(255);
      if (dType == 2){
        for (Bloons b : bloons){
          if (dist(b.getX(), b.getY(), position.x, position.y) <= size * 5){
            DartList.add(new Dart(position.x, position.y, (int)position.x, (int)position.y, 0, damage, 3, 1000, 7, size*20, 255,150,0, 50));
            DartList.remove(this);
            break;
          }
        }
      }
      return false;
    }
     altCount --;
      if (position.x > width || position.x < 0 || position.y > height || position.y < 0|| pierce <= 0 || lifetime <= 0){
        return true;
      }
      fill(r,g,b,a);
      circle(position.x, position.y, size*2);
      if((float)lifetime / (float)altCount <= 2){
        PVector altLaunch = launch;
        altLaunch.setMag(-1);
        position.add(altLaunch);
      }
      else{
        position.add(launch);
      }
      fill(255);
      return false;
  }
  public float getX(){
    return position.x;
  }
  
  public float getY(){
    return position.y;
  }
  
  public void pierced(){
    pierce--;
  }
  
  public int getPierce(){
    return pierce;
  }
  
  public int getDamage(){
    return damage;
  }
  public int getSize(){
    return size;
  }
  public int getProjType(){
    return projType;
  }
}
