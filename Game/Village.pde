public class Village extends Monkey{
  public Village(){
    fireRate = 1;
    damage = 0;
    speed = 15;
    projType = 1;
    size = 40;
    range = 150;
    pierce = 0;
    lifetime = 10;
    projSize = 5;
    villaged1 = true;
    villaged2 = true;
    villaged3 = true;
    villaged4 = true;
    villaged5 = true;
    villaged6 = true;
    villaged7 = false;
    villaged8 = true;
    villaged9 = true;
    
    c = color(163, 71, 0);
    int[][] UpgradeCosts = {{500, 1500, 10000, 12000},{900, 2000, 4300, 24000}};
    String[][] UpgradeNames = {{"Monkey Beacon", "Jungle Drums", "Monkey Town", "HEB", "Max Upgrades"},{"Monkey Fort", "Radar Scanner", "M.I.B", "Call to Arms","Max Upgrades"}};
    int[][] UpgradePierce = {{1,1,1,1},{0,0,0,0}};
    int[][] UpgradeDamage= {{0,0,0,0},{1,1,1,1}};
    int[][] UpgradeProjectile= {{0,0,0,0},{0,0,0,0}};
    int[][] UpgradeAttacksSpd = {{0,0,0,0},{0,0,0,0}};
    int[][] UpgradeRange ={{0,0,0,0},{0,0,0,0}};
    int[][] UpgradeProjSpeed = {{0,0,0,0},{0,0,0,0}};
    int[][] UpgradeProjSize = {{0,0,0,0},{0,0,0,0}};
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
    name = "Monkey Village";
    monkeyImage = VillageBase;
    sidebarImage = village;
    Base = VillageBase;
    P11= VillageP11;
    P12= VillageP12;
    P13= VillageP13;
    P14= VillageP14;
    P23= VillageP23;
    P24= VillageP24;
  }
  float shoot(int x, int y){
    if (timeFired >= fireRate){
      timeFired = 0;
      
      return -PI/2;
    }
    return -PI/2;
  }
  

  public void buff(){
    if (pierce == 0) {
      for (Monkey m : monkeyList){
        if (dist(m.getX(), m.getY(), getX(), getY()) < range && !m.villaged1){
          m.rangeBuff(1.2);
          m.villaged1 = true;
        }
      }
    }
    if (pierce == 1){
      for (Monkey m : monkeyList){
        if (dist(m.getX(), m.getY(), getX(), getY()) < range && !m.villaged2){
          m.rangeBuff(1.2);
          m.villaged2 = true;
        }
      }
    }
   if (pierce == 2){
      for (Monkey m : monkeyList){
        if (dist(m.getX(), m.getY(), getX(), getY()) < range && !m.villaged3){
          int buffed = m.atkSpdBuff(3);
          if (buffed > 0) m.fireRate = buffed;
          else m.fireRate = 1;
          m.villaged3 = true;
        }
      }
    }
    if (pierce == 3){
      for (Monkey m : monkeyList){
        if (dist(m.getX(), m.getY(), getX(), getY()) < range && !m.villaged4){
          m.dmgBuff(1);
          m.pierceBuff(1);
          m.villaged4 = true;
        }
      }
    }
    if (pierce == 4){
      for (Monkey m : monkeyList){
        if (dist(m.getX(), m.getY(), getX(), getY()) < range && !m.villaged5){
          int buffed = m.atkSpdBuff(3);
          if (buffed > 0) m.fireRate = buffed;
          else m.fireRate = 1;
          m.villaged5 = true;
        }
      }
    }
    
    
    if (damage == 1){
      for (Monkey m : monkeyList){
        if (dist(m.getX(), m.getY(), getX(), getY()) < range && !m.villaged6){
          m.dmgBuff(1);
          m.villaged6 = true;
        }
      }
    }
   if (damage == 2){
        if (!villaged7){
          this.rangeBuff(1.2);
          this.villaged7 = true;
        }
    }
    if (damage == 3){
      for (Monkey m : monkeyList){
        if (dist(m.getX(), m.getY(), getX(), getY()) < range && !m.villaged8){
          m.projType = 2;
          m.villaged8 = true;
        }
      }
    }
    if (damage == 4){
      for (Monkey m : monkeyList){
        if (dist(m.getX(), m.getY(), getX(), getY()) < range && !m.villaged9){
          m.dmgBuff(1);
          m.pierceBuff(1);
          int buffed = m.atkSpdBuff(3);
          if (buffed > 0) m.fireRate = buffed;
          else m.fireRate = 1;
          m.villaged9 = true;
        }
      }
    }
  }
}
