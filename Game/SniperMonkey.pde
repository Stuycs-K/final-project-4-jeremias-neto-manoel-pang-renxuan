public class SniperMonkey extends Monkey{
  public SniperMonkey(){
    fireRate =180;
    damage = 2;
    speed = 15;
    projType = 1;
    size = 40;
    range = 10000;
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
    int[][] UpgradeCosts = {{140, 170, 500, 1500},{90, 120, 330, 2000}};
    String[][] UpgradeNames = {{"FMJ", "Five point Oh", "Deadly Precision","Cripple MOAB","Max Upgrades"},{"Faster Firing", "Night Vision Goggles", "Semi-Auto Rifle", "Supply Drop","Max Upgrades"}};
    int[][] UpgradePierce = {{0,0,0,0},{0,0,0,0}};
    int[][] UpgradeDamage= {{2,3,11,42},{0,1,0,1}};
    int[][] UpgradeProjectile= {{2,2,2,2},{1,1,1,1}};
    int[][] UpgradeAttacksSpd = {{0,0,0,0},{30,10,100,0}};
    upgradeCosts = UpgradeCosts;
    upgradeNames = UpgradeNames;
    upgradePierce = UpgradePierce;
    upgradeDamage = UpgradeDamage;
    upgradeProjectile = UpgradeProjectile;
    upgradeAttacksSpd = UpgradeAttacksSpd;
    
    //
    name = "Sniper Monkey";
    monkeyImage = SniperBase;
    sidebarImage = snipiMonki;
    
    Base = SniperBase;
    P11 = SniperP11;
    P12 = SniperP12;
    P13 = SniperP13;
    P14 = SniperP14;
    P23 = SniperP23;
    P24 = SniperP24;
  }
  float shoot(int x, int y){
    if (timeFired >= fireRate){
      
      for (Bloons b : bloons){
        if (dist(b.getX(), b.getY(), posx, posy) <= range && !(snipertargeting.contains(b))){
          x=b.getX();
          y=b.getY();
          snipertargeting.add(b);
          break;
        }
      }
      timeFired = 0;
      PVector shot = new PVector(x-posx, y-posy);
      shot.normalize();
      float angle = atan2(shot.y, shot.x);
      Dart dart = new Dart(x,y, x, y, 0, damage, projType, 1, 2, projSize,0,0,0);
      DartList.add(dart);
      dartCount ++;
      if(upgrade2Prog == 4){
       money += 2; 
      }
      return angle;
    }
    return lastAngle;
  }
}
