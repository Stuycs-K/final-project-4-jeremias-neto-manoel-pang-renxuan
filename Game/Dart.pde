  public class Dart{
  PVector launch = new PVector(0,0);
  PVector position = new PVector(0,0);
  int damage;
  int projType;
  
  public Dart(float posx, float posy, int launchx, int launchy, int speed, int damage_, int projType_){
    position.set(launchx, launchy);
    launch.set(posx, posy);
    launch.normalize();
    launch.setMag(speed);
    damage = damage_;
    projType = projType_;
  }
    public boolean update(){
      if (position.x > width || position.x < 0 || position.y > height || position.y < 0){
        return true;
      }
      fill(0);
      circle(position.x, position.y, 10);
      position.add(launch);
      fill(255);
      
      return false;
    }
  
}
