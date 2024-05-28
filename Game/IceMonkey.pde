public class IceMonkey extends Monkey{
  public IceMonkey(){
    fireRate = 50;
    damage = 1;
    speed = 15;
    projType = 1;
    size = 40;
    range = 150;
    pierce = 1;
    c = color(163, 71, 0);
    int[][] UpgradeCosts = {{0, 0, 0, 0}, {0, 0, 0, 0}};
    upgradeCosts = UpgradeCosts;
    String[][] UpgradeNames = {{"", "", "", ""},{"", "", "", ""}};
    upgradeNames = UpgradeNames;
    name = "Ice Monkey";
    monkeyImage = iceMonki;
  }
  float shoot(Bloons b){
    if (timeFired >= fireRate){
      int bloonx = b.getX() - posx;
      int bloony = b.getY() - posy;
      timeFired = 0;
      DartList.add(new Dart(bloonx, bloony, posx, posy, speed, damage, projType, pierce));
      dartCount ++;
      return atan2(bloony, bloonx)- PI;
    }
    return lastAngle;
  }
}
