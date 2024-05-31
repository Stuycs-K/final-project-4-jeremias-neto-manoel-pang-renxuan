public class DartMonkey extends Monkey{
  public DartMonkey(){
    
    //monkey stats
    fireRate = 50;
    damage = 4;
    speed = 15;
    projType = 1;
    size = 40;
    range = 150;
    pierce = 1;
    
    //color (not used anymore)
    c = color(163, 71, 0);
    
    //upgrade info
    int[][] UpgradeCosts = {{90, 120, 330, 2000}, {140, 170, 500, 1500}};
    String[][] UpgradeNames = {{"Long Range Darts", "Enhanced Eyesight", "Triple Darts", "SM Fan Club"},{"Sharp Shots", "Razor Sharp Shots", "Spike-O-Pult", "Juggernaut"}};
    int[][] UpgradePierce = {{0,0,18,72},{1,2,0,0}};
    int[][] UpgradeCamo= {{0,1,1,1}, {0,0,0,0}};
    int[][] UpgradeDamage= {{0,0,2,5},{0,0,0,0}};
    int[][] UpgradeProjectile= {{1,1,2,3},{1,1,1,1}};
    int[][] UpgradeAttacksSpd = {{0,0,-3, -2},{0,0,0,10}};
    int[][] UpgradeRange ={{25,25, 0, 25},{0,0,0,0}};
    upgradeCosts = UpgradeCosts;
    upgradeNames = UpgradeNames;
    upgradePierce = UpgradePierce;
    upgradeCamo = UpgradeCamo;
    upgradeDamage = UpgradeDamage;
    upgradeProjectile = UpgradeProjectile;
    upgradeAttacksSpd = UpgradeAttacksSpd;
    upgradeRange = UpgradeRange;
    
    //monkey name
    name = "Dart Monkey";
    monkeyImage = monkiDart;
  }
}
