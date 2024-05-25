public class SideBar{
  private boolean isShop = true;
  
  public SideBar(){
  }
  public boolean isShop(){
    return isShop;
  }
  public void makeShop(){
    isShop = true;
  }
  
  public void makeUpgrade(){
    isShop = false;
  }
  
  public void onClick(){
    if(isShop){
      if(mouseX > 1515 && mouseX < 1515+125 && mouseY > 120 && mouseY < 270){
        placingMonkey = new DartMonkey();
      }
    }
  }
  public void update(){
    fill(203, 145, 79);
    rect(1500,0,300,1000);
    if (isShop){
      fill(150, 100, 50);
      rect(1515, 15, 270, 90);
      DisplayDartMonkey();
      DisplayTackShooter();
      DisplayBombShooter();
      DisplayIceMonkey();
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
    fill(203, 145, 79);
    dartMonki.resize(0,150);
    image(dartMonki, 1515, 120);
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
    //dartMonki.resize(0,150);
    //image(dartMonki, 1515, 120); replace these with tack shooter images
    fill(133, 228, 255);
    rect(1665, 120, 125, 150);
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
    //dartMonki.resize(0,150);
    //image(dartMonki, 1515, 120); replace with bomb shooter image
    fill(133, 228, 255);
    rect(1515, 285, 125, 150);
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
    //dartMonki.resize(0,150);
    //image(dartMonki, 1515, 120); replace with ice monkey
    fill(133, 228, 255);
    rect(1665, 285, 125, 150);
  }
}
