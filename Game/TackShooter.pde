public class TackShooter extends Monkey{
  public TackShooter(){
    fireRate = 55;
    damage = 1;
    speed = 15;
    projType = 1;
    size = 40;
    range = 80;
    pierce = 1;
    c = color(163, 71, 0);
    int[][] UpgradeCosts = {{0, 0, 0, 0}, {0, 0, 0, 0}};
    upgradeCosts = UpgradeCosts;
    String[][] UpgradeNames = {{"temp", "temp", "temp", "temp"},{"temp", "temp", "temp", "temp"}};
    upgradeNames = UpgradeNames;
    name = "Tack Shooter";
    monkeyImage = tackShooti;
  }
  float shoot(Bloons b){
    if (timeFired >= fireRate){
      timeFired = 0;
      DartList.add(new Dart(1, 0, posx, posy, speed, damage, projType, pierce));
      DartList.add(new Dart(1, 1, posx, posy, speed, damage, projType, pierce));
      DartList.add(new Dart(0, 1, posx, posy, speed, damage, projType, pierce));
      DartList.add(new Dart(-1, 1, posx, posy, speed, damage, projType, pierce));
      DartList.add(new Dart(-1, 0, posx, posy, speed, damage, projType, pierce));
      DartList.add(new Dart(-1, -1, posx, posy, speed, damage, projType, pierce));
      DartList.add(new Dart(0, -1, posx, posy, speed, damage, projType, pierce));
      DartList.add(new Dart(1, -1, posx, posy, speed, damage, projType, pierce));
      dartCount += 8;
      return -PI/2;
    }
    return -PI/2;
  }
}
