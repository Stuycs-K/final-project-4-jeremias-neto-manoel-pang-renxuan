public class BoomerangMonkey extends Monkey{
  public BoomerangMonkey(){
    fireRate = 55;
    damage = 1;
    speed = 15;
    projType = 1;
    size = 40;
    range = 80;
    pierce = 1;
    lifetime = 10;
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
    int[][] UpgradeCosts = {{250, 280, 1400, 9000},{100, 150, 1600, 3000}};
    String[][] UpgradeNames = {{"MultiTarget", "Glaive Thrower", "Glaive Ricochet", "Glaive Lord", "Max Upgrades"},{"Sonic Boom", "Red Hot 'Rangs", "Bionic Boomer", "Turbo Charge","Max Upgrades"}};
    int[][] UpgradePierce = {{0,0,12,87},{0,2,0,0}};
    int[][] UpgradeDamage= {{0,0,2,5},{0,0,0,0}};
    int[][] UpgradeProjectile= {{1,1,2,3},{1,1,1,1}};
    int[][] UpgradeAttacksSpd = {{0,0,-3,-5},{0,0,0,100}};
    int[][] UpgradeRange ={{0,0,0,0},{25,25, 0, 25}};
    int[][] UpgradeProjSpeed = {{0,0,-2,-1},{0,0,1,1}};
    int[][] UpgradeProjSize = {{0,0,0,0},{0,0,2,2}};
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
    name = "Boomer Monkey";
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
  float shoot(int x, int y){
    if (timeFired >= fireRate){
      timeFired = 0;
      
      
      return -PI/2;
      
    }
    return -PI/2;
  }
}
