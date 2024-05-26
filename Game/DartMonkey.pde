public class DartMonkey extends Monkey{
  public DartMonkey(){
    fireRate = 50;
    damage = 1;
    speed = 15;
    projType = 1;
    size = 40;
    range = 150;
    c = color(163, 71, 0);
    int[][] UpgradeCosts = {{90, 120, 330, 2000}, {140, 170, 500, 1500}};
    upgradeCosts = UpgradeCosts;
    String[][] UpgradeNames = {{"Long Range Darts", "Enhanced Eyesight", "Triple Darts", "Super Monkey Fan Club"},{"Sharp Shots", "Razor Sharp Shots", "Spike-O-Pult", "Juggernaut"}};
    upgradeNames = UpgradeNames;
    name = "Dart Monkey";
    monkeyImage = monkiDart;
  }
}
