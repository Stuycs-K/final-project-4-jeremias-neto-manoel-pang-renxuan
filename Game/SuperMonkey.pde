public class SuperMonkey extends Monkey{
  public SuperMonkey(){
    fireRate = 5;
    damage = 1;
    speed = 15;
    projType = 1;
    size = 40;
    range = 200;
    pierce = 1;
    lifetime = 40;
    projSize = 5;
    
    c = color(163, 71, 0);
    int[][] UpgradeCosts = {{3500, 3500, 11000, 20000},{1000, 1500, 11000, 13000}};
    String[][] UpgradeNames = {{"Laser Blasts", "Plasma Blasts", "Sun Avatar", "Sun God", "Max Upgrades"},{"Super Range", "Epic Range", "Robo Monkey", "Tech Terror","Max Upgrades"}};
    int[][] UpgradePierce = {{1,1,13,5},{0,0,2,4}};
    int[][] UpgradeDamage= {{1,1,1,3},{0,0,1,2}};
    int[][] UpgradeProjectile= {{1,2,2,2},{1,1,2,2}};
    int[][] UpgradeAttacksSpd = {{0,-2,0,-3},{0,0,0,0}};
    int[][] UpgradeRange ={{0,0,0,0},{25,35, 0, 0}};
    int[][] UpgradeProjSpeed = {{0,0,0,0},{0,0,1,1}};
    int[][] UpgradeProjSize = {{1,3,3,4},{0,0,2,2}};
    upgradeCosts = UpgradeCosts;
    upgradeNames = UpgradeNames;
    upgradePierce = UpgradePierce;
    upgradeDamage = UpgradeDamage;
    upgradeProjectile = UpgradeProjectile;
    upgradeAttacksSpd = UpgradeAttacksSpd;
    upgradeRange = UpgradeRange;
    upgradeProjSpeed = UpgradeProjSpeed;
    upgradeProjSize = UpgradeProjSize;
    
    name = "Super Monkey";
    monkeyImage = SuperBase;
    sidebarImage = superMonki;
    Base = SuperBase;
    P11= SuperP11;
    P12= SuperP12;
    P13= SuperP13;
    P14= SuperP14;
    P23= SuperP23;
    P24= SuperP24;
  }
  float shoot(int x, int y){
    if (timeFired >= fireRate){
      int bloonx = x;
      int bloony = y;
      timeFired = 0;
      if (upgrade1Prog >=3){
        PVector shot = new PVector(bloonx-posx, bloony-posy);
        shot.normalize();
        float angle = atan2(shot.y, shot.x);
        DartList.add(new Dart(cos(angle + PI/6), sin(angle +PI/6), posx, posy, speed, damage, projType, pierce, lifetime, projSize, 255,255,100));
        dartCount ++;
        DartList.add(new Dart(cos(angle - PI/6), sin(angle - PI/6), posx, posy, speed, damage, projType, pierce, lifetime, projSize,255,255,100));
        dartCount ++;
        DartList.add(new Dart(cos(angle),sin(angle), posx, posy, speed, damage, projType, pierce, lifetime, projSize,255,255,100));
        dartCount ++;
      }
      else if(upgrade2Prog >= 3){
        PVector shot = new PVector(bloonx-posx, bloony-posy);
        shot.normalize();
        float angle = atan2(shot.y, shot.x);
        
        DartList.add(new Dart(cos(angle), sin(angle), posx+(int)(20*sin(angle)), posy-(int)(20*cos(angle)), speed, damage, projType, pierce, lifetime, projSize,0,150,0));
        dartCount ++;
        DartList.add(new Dart(cos(angle), sin(angle), posx-(int)(20*sin(angle)), posy+(int)(20*cos(angle)), speed, damage, projType, pierce, lifetime, projSize,0,150,0));
        dartCount ++;
      }
      else{
        DartList.add(new Dart(bloonx, bloony, posx, posy, speed, damage, projType, pierce, lifetime, projSize,0,0,0));
        dartCount ++;
      }
      return atan2(bloony-posy, bloonx-posx);
    }
    return lastAngle;
  }
}
