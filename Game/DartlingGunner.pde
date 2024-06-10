public class DartlingGunner extends Monkey{
  public DartlingGunner(){
    fireRate = 20;
    damage = 1;
    speed = 20;
    projType = 1;
    size = 40;
    range = 10000;
    pierce = 1;
    lifetime = 100000;
    projSize = 5;
    villaged1 = false;
    villaged2 = false;
    villaged3 = false;
    villaged4 = false;
    villaged5 = false;
    villaged6 = false;
    villaged7 = false;
    villaged8 = false;
    villaged9 = false;
    
    c = color(163, 71, 0);
    int[][] UpgradeCosts = {{250, 1200, 6000, 55000},{510, 1000, 7000, 20000}};
    String[][] UpgradeNames = {{"Faster Darts", "Faster Barrel", "Laser Cannon", "Ray of Doom", "Max Upgrades"},{"Powerful Darts", "Bloontonium Darts", "Hydra Rocket Pods", "BADS","Max Upgrades"}};
    int[][] UpgradePierce = {{0,0,12,87},{0,2,2,0}};
    int[][] UpgradeDamage= {{0,0,2,-2},{0,0,0,0}};
    int[][] UpgradeProjectile= {{1,1,1,3},{1,1,2,2}};
    int[][] UpgradeAttacksSpd = {{0,5,2,10000},{0,0,-7,10}};
    int[][] UpgradeRange ={{0,0,0,0},{25,25, 0, 25}};
    int[][] UpgradeProjSpeed = {{2,0,2,20},{0,0,1,1}};
    int[][] UpgradeProjSize = {{0,0,2,10},{0,0,5,0}};
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
    name = "Dartling Gunner";
    monkeyImage = GunnerBase;
    sidebarImage = dartiGunni;
    Base = GunnerBase;
    P11 = GunnerBase;
    P12 = GunnerBase;
    P13 = GunnerBase;
    P14 = GunnerBase;
    P23 = GunnerBase;
    P24 = GunnerBase;
  }
  float shoot(int x, int y){
    PVector shot = new PVector(mouseX-posx, mouseY-posy);
      shot.normalize();
      float angle = atan2(shot.y, shot.x);
    if (timeFired >= fireRate){
      timeFired = 0;
      if (upgrade1Prog == 3){
        DartList.add(new Dart(cos(angle), sin(angle), posx+(int)(cos(angle)), posy+(int)(sin(angle)), speed, damage, projType, pierce, lifetime, projSize,255,0,0));
      }
      else if(upgrade1Prog > 3){
        for (int i = 0; i < 300; i += 10){
          DartList.add(new Dart(cos(angle), sin(angle), posx+(int)(i*cos(angle)), posy+(int)(i*sin(angle)), speed, damage, projType, pierce, lifetime, projSize,255,0,0));
        }
      }
      else if (upgrade2Prog >=3){
        DartList.add(new Dart(2,cos(angle), sin(angle), posx, posy, speed, damage,3, pierce, lifetime, projSize,0,0,0));
      }
      else{
        DartList.add(new Dart(cos(angle), sin(angle), posx, posy, speed, damage, projType, pierce, lifetime, projSize,0,0,0));
        dartCount ++;
      }
    }
    return angle;
  }
}
