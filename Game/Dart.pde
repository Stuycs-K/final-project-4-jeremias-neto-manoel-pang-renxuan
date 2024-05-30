  public class Dart{
  PVector launch = new PVector(0,0);
  PVector position = new PVector(0,0);
  int damage;
  int projType;
  int pierce;
  int size;
  
  //1 is dart, 2 is spiked ball, 3, is juggball, 4 is triple darts, 5 is boomerang, 6 is glaive, 
  
  public Dart(float posx, float posy, int launchx, int launchy, int speed, int damage_, int projType_, int pierce_){
    position.set(launchx, launchy);
    launch.set(posx, posy);
    launch.normalize();
    launch.setMag(speed);
    damage = damage_;
    projType = projType_;
    pierce = pierce_;
  }
    public boolean update(){
      //if (position.x > width || position.x < 0 || position.y > height || position.y < 0){
      //  return true;
      //}
      fill(0);
      circle(position.x, position.y, 10);
      position.add(launch);
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
}
