public class BombShooter extends Monkey{
  public BombShooter(){
    fireRate = 65;
    damage = 1;
    speed = 10;
    projType = 3;
    size = 40;
    range = 150;
    pierce = 1;
    lifetime = 35;
    projSize = 10;
    
    c = color(163, 71, 0);
    int[][] UpgradeCosts = {{200, 300, 800, 4000},{400, 400, 900, 3200}};
    String[][] UpgradeNames = {{"Extra Range", "Frag Bombs", "Cluster Bombs", "Bloon Impact", "Max Upgrades"},{"Bigger Bombs", "Missile Launcher", "MOAB Mauler", "MOAB Assassin","Max Upgrades"}};
    int[][] UpgradePierce = {{1,2,18,72},{0,0,0,0}};
    int[][] UpgradeDamage= {{0,2,2,3},{0,0,0,2}};
    int[][] UpgradeProjectile= {{3,3,3,2},{1,1,1,1}};
    int[][] UpgradeAttacksSpd = {{0,0,0,0},{0,15,2,2}};
    int[][] UpgradeRange ={{20,0,0,0},{0,25, 0, 0}};
    int[][] UpgradeProjSpeed = {{0,0,0,0},{0,1,1,2}};
    int[][] UpgradeProjSize = {{0,0,0,0},{4,0,-1,0}};
    upgradeCosts = UpgradeCosts;
    upgradeNames = UpgradeNames;
    upgradePierce = UpgradePierce;
    upgradeDamage = UpgradeDamage;
    upgradeProjectile = UpgradeProjectile;
    upgradeAttacksSpd = UpgradeAttacksSpd;
    upgradeRange = UpgradeRange;
    upgradeProjSpeed = UpgradeProjSpeed;
    upgradeProjSize = UpgradeProjSize;
    
    //
    name = "Bomb Shooter";
    monkeyImage = BombBase;
    sidebarImage = bombShooti;
    
    Base= BombBase;
    P11= BombP11;
    P12= BombP12;
    P13= BombP13;
    P14= BombP14;
    P23= BombP23;
    P24= BombP24;
  }
  float shoot(int x, int y){
    if (timeFired >= fireRate){
      timeFired = 0;
      PVector shot = new PVector(x-posx, y-posy);
      shot.normalize();
      float angle = atan2(shot.y, shot.x);
      DartList.add(new Dart(2,cos(angle), sin(angle), posx, posy, speed, damage, 3, pierce, lifetime, projSize,0,0,0));
      return angle;
    }
    return lastAngle;
  }
}
