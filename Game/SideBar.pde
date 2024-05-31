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
      if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 120 && mouseY < 270){
        placingMonkey = new DartMonkey();
      }
      if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 120 && mouseY<270){
        placingMonkey = new TackShooter();
      }
      if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 285 && mouseY < 285+150){
        placingMonkey = new IceMonkey();
      }
      if(mouseX > 1607 && mouseX < 1697 && mouseY > 858 && mouseY < 950)
        started = true;
      if (mouseX > 1700 && mouseX < 1700 + 75 && mouseY > 780 && mouseY < 875)
        nextPG();
    }
    
    if (isShop == 2){
      if(mouseX > 1607 && mouseX < 1697 && mouseY > 858 && mouseY < 950)
        started = true;
      if (mouseX > 1700 - 180 && mouseX < 1700 + 75 - 180 && mouseY > 780 && mouseY < 875)
        prevPG();
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
      DisplayIceMonkey();
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
      upgradeMonkey.displayUpgrades();
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
    dartMonki.resize(0,130);
    if (money < 200){
      dartMonki.filter(GRAY);
      fill(175,175,175);
    }
    else{
      fill(133, 228, 255);
    }
    rect(1515, 120, 125, 150);
    image(dartMonki, 1535, 130);
    fill(255);
    rect(1550, 238, 60, 30);
    fill(0);
    textSize(25);
    text("$" + 200, 1580, 265);
  }
  
  private void DisplayTackShooter(){
    if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 120 && mouseY < 270){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tack Shooter", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(203, 145, 79);
    fill(133, 228, 255);
    rect(1665, 120, 125, 150);
    tackShooti.resize(0,125);
    image(tackShooti, 1520+150, 130);
  }
  
  private void DisplayBombShooter(){
    if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 285 && mouseY < 285+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Bomb Shooter", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(203, 145, 79);
    fill(133, 228, 255);
    rect(1515, 285, 125, 150);
    bombShooti.resize(0,100);
    image(bombShooti, 1520, 310);
  }
  
  private void DisplayIceMonkey(){
    if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 285 && mouseY < 285+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Ice Monkey", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(203, 145, 79);
    fill(133, 228, 255);
    rect(1665, 285, 125, 150);
    iceMonki.resize(0,130);
    image(iceMonki, 1520+150, 295);
  }
  
  private void DisplayTowerFive(){
    if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 450 && mouseY < 450+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tower Five", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(203, 145, 79);
    fill(133, 228, 255);
    rect(1515, 450, 125, 150);
  }
  
  private void DisplayTowerSix(){
    if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 450 && mouseY < 450+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tower Six", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(203, 145, 79);
    fill(133, 228, 255);
    rect(1665, 450, 125, 150);
  }
   
  private void DisplayTowerSeven(){
    if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 615 && mouseY < 615+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tower Seven", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(203, 145, 79);
    fill(133, 228, 255);
    rect(1515, 450+165, 125, 150);
  }
  
  private void DisplayTowerEight(){
    if(mouseX > 1665 && mouseX < 1665+125 && mouseY > 615 && mouseY < 615+150){
        rectMode(CENTER);
        textSize(30);
        fill(255);
        text("Tower Eight", 1515 + 135, 15 + 55);
        rectMode(CORNER);
    }
    fill(203, 145, 79);
    fill(133, 228, 255);
    rect(1665, 615, 125, 150);
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
    fill(203, 145, 79);
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
    fill(203, 145, 79);
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
    fill(203, 145, 79);
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
    fill(203, 145, 79);
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
    fill(203, 145, 79);
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
    fill(203, 145, 79);
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
    fill(203, 145, 79);
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
    fill(203, 145, 79);
    fill(133, 228, 255);
    rect(1665, 615, 125, 150);
  }
}
