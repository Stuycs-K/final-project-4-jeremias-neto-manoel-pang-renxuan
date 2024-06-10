public class DartMonkey extends Monkey{
  public DartMonkey(){
    
    //monkey stats
    fireRate = 50;
    damage = 1;
    speed = 15;
    projType = 1;
    size = 40;
    range = 150;
    pierce = 1;
    lifetime = 25;
    projSize = 5;
    
    //color (not used anymore)
    c = color(163, 71, 0);
    
    //upgrade info
    int[][] UpgradeCosts = {{140, 170, 500, 1500},{90, 120, 330, 2000}};
    String[][] UpgradeNames = {{"Sharp Shots", "Razor Sharp Shots", "Spike-O-Pult", "Juggernaut", "Max Upgrades"},{"Long Range Darts", "Enhanced Eyesight", "Triple Darts", "SM Fan Club","Max Upgrades"}};
    int[][] UpgradePierce = {{1,2,18,72},{0,0,0,0}};
    int[][] UpgradeDamage= {{0,0,2,5},{0,0,0,0}};
    int[][] UpgradeProjectile= {{1,1,2,3},{1,1,1,1}};
    int[][] UpgradeAttacksSpd = {{0,0,-3,-5},{0,0,0,45}};
    int[][] UpgradeRange ={{0,0,0,0},{25,25, 0, 25}};
    int[][] UpgradeProjSpeed = {{0,0,-2,-1},{0,0,1,1}};
    int[][] UpgradeProjSize = {{0,0,5,10},{0,0,0,0}};
    upgradeCosts = UpgradeCosts;
    upgradeNames = UpgradeNames;
    upgradePierce = UpgradePierce;
    upgradeDamage = UpgradeDamage;
    upgradeProjectile = UpgradeProjectile;
    upgradeAttacksSpd = UpgradeAttacksSpd;
    upgradeRange = UpgradeRange;
    upgradeProjSpeed = UpgradeProjSpeed;
    upgradeProjSize = UpgradeProjSize;
    
    
    //monkey name
    name = "Dart Monkey";
    monkeyImage = DartBase;
    sidebarImage = dartMonki;
    
  Base = DartBase;
  P11 = DartP11;
  P12 = DartP12;
  P13 = DartP13;
  P14 = DartP14;
  P23 = DartP23;
  P24 = DartP24;
  }
  float shoot(int x, int y){
    return 1.0;
  }
}
