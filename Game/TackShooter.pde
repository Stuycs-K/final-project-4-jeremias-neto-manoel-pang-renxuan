public class TackShooter extends Monkey{
  public TackShooter(){
    fireRate = 60;
    damage = 1;
    speed = 15;
    projType = 1;
    size = 40;
    range = 80;
    pierce = 1;
    lifetime = 10;
    projSize = 5;
    
    c = color(163, 71, 0);
    int[][] UpgradeCosts = {{180, 255, 425, 2500},{100, 225, 680, 1000}};
    String[][] UpgradeNames = {{"Faster Shooting", "Even Faster Shooting", "Tack Sprayer", "Ring of Fire", "Max Upgrades"},{"Extra Range Tacks", "Super Range Tacks", "Blade Shooter", "Blade Maelstrom","Max Upgrades"}};
    int[][] UpgradePierce = {{1,1,1,20},{0,0,3,2}};
    int[][] UpgradeDamage= {{0,0,0,2},{0,0,0,0}};
    int[][] UpgradeProjectile= {{1,1,1,2},{1,1,1,1}};
    int[][] UpgradeAttacksSpd = {{7,7,4,15},{0,0,-3,3}};
    int[][] UpgradeRange ={{0,0,0,10},{10,10, 0, 0}};
    int[][] UpgradeProjSize = {{0,0,0,100},{0,0,4,0}};
    //upgradeCosts = UpgradeCosts;
    upgradeCosts = UpgradeCosts;
    upgradeNames = UpgradeNames;
    upgradePierce = UpgradePierce;
    upgradeDamage = UpgradeDamage;
    upgradeProjectile = UpgradeProjectile;
    upgradeAttacksSpd = UpgradeAttacksSpd;
    upgradeRange = UpgradeRange;
    upgradeProjSize = UpgradeProjSize;
    
    //
    name = "Tack Shooter";
    monkeyImage = TackBase;
    sidebarImage = tackShooti;
    Base= TackBase;
    P11= TackP11;
    P12= TackP12;
    P13= TackP13;
    P14= TackP14;
    P23= TackP23;
    P24= TackP24;
  }
  float shoot(int x, int y){
    if (timeFired >= fireRate){
      timeFired = 0;
      if(upgrade1Prog == 3){
        for(int i = 0; i < 16; i ++){
          float angle = (PI/8 * i);
          DartList.add(new Dart(cos(angle), sin(angle), posx, posy, speed, damage, projType, pierce, lifetime, projSize,0,0,0));
          dartCount ++;
        }
      }
      else if(upgrade1Prog >=4){
        DartList.add(new Dart((float)posx, (float)posy, (int)posx, (int)posy, 0, damage, projType, pierce, 7, range, 255,150,0,70));
        dartCount ++;
      }
      else{
        for(int i = 0; i < 8; i ++){
          float angle = (PI/4 * i);
          DartList.add(new Dart(cos(angle), sin(angle), posx, posy, speed, damage, projType, pierce, lifetime, projSize,0,0,0));
          dartCount ++;
        }
      }
      return -PI/2;
    }
    return -PI/2;
  }
}
