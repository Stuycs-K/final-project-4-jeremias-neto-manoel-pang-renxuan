public class BoomerangMonkey extends Monkey{
  public BoomerangMonkey(){
    fireRate = 55;
    damage = 1;
    speed = 15;
    projType = 1;
    size = 40;
    range = 80;
    pierce = 1;
    canCamo = false;
    lifetime = 10;
    projSize = 5;
    
    c = color(163, 71, 0);
    int[][] UpgradeCosts = {{140, 170, 500, 1500},{90, 120, 330, 2000}};
    String[][] UpgradeNames = {{"Sharp Shots", "Razor Sharp Shots", "Spike-O-Pult", "Juggernaut", "Max Upgrades"},{"Long Range Darts", "Enhanced Eyesight", "Triple Darts", "SM Fan Club","Max Upgrades"}};
    int[][] UpgradePierce = {{1,2,18,72},{0,0,0,0}};
    int[][] UpgradeCamo= {{0,0,0,0}, {0,1,1,1}};
    int[][] UpgradeDamage= {{0,0,2,5},{0,0,0,0}};
    int[][] UpgradeProjectile= {{1,1,2,3},{1,1,1,1}};
    int[][] UpgradeAttacksSpd = {{0,0,-3,-5},{0,0,0,100}};
    int[][] UpgradeRange ={{0,0,0,0},{25,25, 0, 25}};
    int[][] UpgradeProjSpeed = {{0,0,-2,-1},{0,0,1,1}};
    int[][] UpgradeProjSize = {{0,0,0,0},{0,0,2,2}};
    upgradeCosts = UpgradeCosts;
    upgradeNames = UpgradeNames;
    upgradePierce = UpgradePierce;
    upgradeCamo = UpgradeCamo;
    upgradeDamage = UpgradeDamage;
    upgradeProjectile = UpgradeProjectile;
    upgradeAttacksSpd = UpgradeAttacksSpd;
    upgradeRange = UpgradeRange;
    upgradeProjSpeed = UpgradeProjSpeed;
    upgradeProjSize = UpgradeProjSize;
    
    //
    name = "Tack Shooter";
    monkeyImage = BoomerangBase;
    sidebarImage = boomerMonki;
    Base = BoomerangBase;
    P11 = BoomerangP11;
    P12= BoomerangP12;
    P13= BoomerangP13;
    P14= BoomerangP14;
    P23= BoomerangP23;
    P24= BoomerangP24;
  }
  float shoot(Bloons b){
    if (timeFired >= fireRate){
      timeFired = 0;
      DartList.add(new Dart(1, 0, posx, posy, speed, damage, projType, pierce, lifetime, projSize));
      DartList.add(new Dart(1, 1, posx, posy, speed, damage, projType, pierce, lifetime, projSize));
      DartList.add(new Dart(0, 1, posx, posy, speed, damage, projType, pierce, lifetime, projSize));
      DartList.add(new Dart(-1, 1, posx, posy, speed, damage, projType, pierce, lifetime, projSize));
      DartList.add(new Dart(-1, 0, posx, posy, speed, damage, projType, pierce, lifetime, projSize));
      DartList.add(new Dart(-1, -1, posx, posy, speed, damage, projType, pierce, lifetime, projSize));
      DartList.add(new Dart(0, -1, posx, posy, speed, damage, projType, pierce, lifetime, projSize));
      DartList.add(new Dart(1, -1, posx, posy, speed, damage, projType, pierce, lifetime, projSize));
      dartCount += 8;
      return -PI/2;
    }
    return -PI/2;
  }
}
