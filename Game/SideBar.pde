public class SideBar{
  private int isShop = 1;
  
  public SideBar(){
  }
  
  public boolean isShop(){
    return isShop > 0;
  }
  public void makeShop(){
    isShop = 1;
  }
  
  public void makeUpgrade(){
    isShop = 0;
  }
  
  public void nextPG(){
    isShop ++;
  }
  
  public void prevPG(){
    isShop--;
  }
  
  public void onClick(){
    if(isShop == 1){
      if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 120 && mouseY < 270 && money >= 200){
        placingMonkey = new DartMonkey();
        placingMonkey.cashmonkey(200);
        money -= 200;
      }
      if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 120 && mouseY < 270 && money >= 260){
        placingMonkey = new TackShooter();
        placingMonkey.cashmonkey(260);
        money -= 260;
      }
      if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 285 && mouseY < 285+150 && money >= 525){
        placingMonkey = new BombShooter();
        placingMonkey.cashmonkey(525);
        money -= 525;
      }
      if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 285 && mouseY < 285+150 && money >= 315){
        placingMonkey = new BoomerangMonkey();
        placingMonkey.cashmonkey(315);
        money -= 315;
      }
      if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 450 && mouseY < 450+150 && money >= 350){
        placingMonkey = new SniperMonkey();
        placingMonkey.cashmonkey(350);
        money -= 350;
      }
      if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 450 && mouseY < 450+150 && money >= 850){
        placingMonkey = new DartlingGunner();
        placingMonkey.cashmonkey(850);
        money -= 850;
      }
      if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 615 && mouseY < 615+150 && money >= 2500){
        placingMonkey = new SuperMonkey();
        placingMonkey.cashmonkey(2500);
        money -= 2500;
      }
      if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 615 && mouseY < 615+150 && money >= 1200){
        placingMonkey = new Village();
        placingMonkey.cashmonkey(1200);
        money -= 1200;
      }
      if(mouseX > 1607 && mouseX < 1697 && mouseY > 858 && mouseY < 950 && !started){
        started = true;
        rounds++;
      }
      if (mouseX > 1700 && mouseX < 1700 + 75 && mouseY > 780 && mouseY < 875)
        nextPG();
    }
    
    else if (isShop == 2){
      if(mouseX > 1607 && mouseX < 1697 && mouseY > 858 && mouseY < 950){
        started = true;
        rounds++;
      }
      if (mouseX > 1700 - 180 && mouseX < 1700 + 75 - 180 && mouseY > 780 && mouseY < 875)
        prevPG();
    }
    else{
      if (mouseX > 1515 && mouseX < 1515 + 270 && mouseY > 495 && mouseY < 495 + 90 && upgradeMonkey.canUpgrade1()){
        upgradeMonkey.upgrade1();
      }
      if (mouseX > 1515 && mouseX < 1515 + 270 && mouseY > 650 && mouseY < 650 + 90 && upgradeMonkey.canUpgrade2()){
        upgradeMonkey.upgrade2();
      }
      if (mouseX > 1515 && mouseX < 1515 + 270 && mouseY > 895 && mouseY < 895 + 90){
        upgradeMonkey.sell();
      }
    }
  }
  public void update(){
    fill(203, 145, 79);
    rect(1500,0,300,1000);
    //image(left, 1560, 830);
    if (isShop == 1){
      fill(150, 100, 50);
      rect(1515, 15, 270, 90);
      DisplayDartMonkey();
      DisplayTackShooter();
      DisplayBombShooter();
      DisplayTowerFour();
      DisplayTowerFive();
      DisplayTowerSix();
      DisplayTowerSeven();
      DisplayTowerEight();
      imageMode(CENTER);
      image(right, 1740, 830);
      imageMode(CORNERS);
      if (!started) image(startButton, 855, 100);
    }
    else if (isShop == 2){
      fill(150, 100, 50);
      rect(1515, 15, 270, 90);
      DisplayTowerNine();
      DisplayTowerTen();
      DisplayTowerEleven();
      DisplayTowerTwelve();
      DisplayTowerThirteen();
      DisplayTowerFourteen();
      DisplayTowerFifteen();
      DisplayTowerSixteen();
      imageMode(CENTER);
      image(left, 1560, 830);
      imageMode(CORNERS);
      if (!started) image(startButton, 855, 100);
    }
    else{
      if(upgradeMonkey == null){
        isShop = 1;
      }
      else{
        upgradeMonkey.displayUpgrades();
      }
    }
  }
  
  private void DisplayDartMonkey(){
    if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 120 && mouseY < 270){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Dart Monkey", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    dartMonki.resize(0,120);
    PImage temp = dartMonki.copy();
    if (money < 200){
      temp.filter(GRAY);
      fill(175,175,175);
    }
    else{
      temp = dartMonki;
      fill(133, 228, 255);
    }
    rect(1515, 120, 125, 150);
    image(temp, 1540, 125);
    fill(255);
    textSize(25);
    text("$" + 200, 1580-3, 265);
  }
  
  private void DisplayTackShooter(){
    if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 120 && mouseY < 270){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tack Shooter", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    tackShooti.resize(0,110);
    PImage temp = tackShooti.copy();
    if (money < 260){
      temp.filter(GRAY);
      fill(175,175,175);
    }
    else{
      temp = tackShooti;
      fill(133, 228, 255);
    }
    rect(1665, 120, 125, 150);
    image(temp, 1520+155, 135);
    fill(255);
    textSize(25);
    text("$" + 260, 1580+150-3, 265);
  }
  
  private void DisplayBombShooter(){
    if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 285 && mouseY < 285+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Bomb Shooter", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    bombShooti.resize(0,90);
    PImage temp = bombShooti.copy();
    if (money < 525){
      temp.filter(GRAY);
      fill(175,175,175);
    }
    else{
      temp = bombShooti;
      fill(133, 228, 255);
    }
    rect(1515, 285, 125, 150);
    image(temp, 1525, 320);
    fill(255);
    textSize(25);
    text("$" + 525, 1580-3, 265+165);
  }
  
  private void DisplayTowerFour(){
    if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 285 && mouseY < 285+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Boomer Monkey", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    boomerMonki.resize(0,90);
    PImage temp = boomerMonki.copy();
    if (money < 315){
      temp.filter(GRAY);
      fill(175,175,175);
    }
    else{
      temp = boomerMonki;
      fill(133, 228, 255);
    }
    rect(1665, 285, 125, 150);
    image(temp, 1675, 310);
    fill(255);
    textSize(25);
    text("$" + 315, 1580-3+150, 265+165);
  }
  
  private void DisplayTowerFive(){
    if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 450 && mouseY < 450+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Sniper Monkey", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    snipiMonki.resize(0,100);
    PImage temp = snipiMonki.copy();
    if (money < 350){
      temp.filter(GRAY);
      fill(175,175,175);
    }
    else{
      temp = snipiMonki;
      fill(64,200,2);
    }
    rect(1515, 450, 125, 150);
    image(temp, 1540, 470);
    fill(255);
    textSize(25);
    text("$" + 350, 1580-3, 430+165);
  }
  
  private void DisplayTowerSix(){
    if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 450 && mouseY < 450+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Dartling Gunner", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    dartiGunni.resize(0,90);
    PImage temp = dartiGunni.copy();
    if (money < 850){
      temp.filter(GRAY);
      fill(175,175,175);
    }
    else{
      temp = dartiGunni;
      fill(64,200,2);
    }
    rect(1665, 450, 125, 150);
    image(temp, 1690, 480);
    fill(255);
    textSize(25);
    text("$" + 850, 1580-3+150, 430+165);
  }
   
  private void DisplayTowerSeven(){
    if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 615 && mouseY < 615+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Super Monkey", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    superMonki.resize(0,100);
    PImage temp = superMonki.copy();
    if (money < 2500){
      temp.filter(GRAY);
      fill(175,175,175);
    }
    else{
      temp = superMonki;
      fill(204,108,231);
    }
    rect(1515, 450+165, 125, 150);
    image(temp, 1535, 470+165);
    fill(255);
    textSize(25);
    text("$" + 2500, 1580-3, 430+165+165);
  }
  
  private void DisplayTowerEight(){
    if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 615 && mouseY < 615+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Monkey Village", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    village.resize(0,100);
    PImage temp = village.copy();
    if (money < 1200){
      temp.filter(GRAY);
      fill(175,175,175);
    }
    else{
      temp = village;
      fill(255, 222, 89);
    }
    rect(1665, 450+165, 125, 150);
    image(temp, 1535+155, 470+165);
    fill(255);
    textSize(25);
    text("$" + 1200, 1580-3+150, 430+165+165);
  }
  
  // PG2
  
  private void DisplayTowerNine(){
    if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 120 && mouseY < 270){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tower Nine", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(133, 228, 255);
    rect(1515, 120, 125, 150);
  }
  
  private void DisplayTowerTen(){
    if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 120 && mouseY < 270){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tower Ten", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(133, 228, 255);
    rect(1665, 120, 125, 150);
  }
  
  private void DisplayTowerEleven(){
    if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 285 && mouseY < 285+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tower Eleven", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(133, 228, 255);
    rect(1515, 285, 125, 150);
  }
  
  private void DisplayTowerTwelve(){
    if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 285 && mouseY < 285+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tower Twelve", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(133, 228, 255);
    rect(1665, 285, 125, 150);
  }
  
  private void DisplayTowerThirteen(){
    if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 450 && mouseY < 450+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tower Thirteen", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(133, 228, 255);
    rect(1515, 450, 125, 150);
  }
  
  private void DisplayTowerFourteen(){
    if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 450 && mouseY < 450+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tower Fourteen", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(133, 228, 255);
    rect(1665, 450, 125, 150);
  }
   
  private void DisplayTowerFifteen(){
    if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 615 && mouseY < 615+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tower Fifteen", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(133, 228, 255);
    rect(1515, 450+165, 125, 150);
  }
  
  private void DisplayTowerSixteen(){
    if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 615 && mouseY < 615+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tower Sixteen", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(133, 228, 255);
    rect(1665, 615, 125, 150);
  }
}
