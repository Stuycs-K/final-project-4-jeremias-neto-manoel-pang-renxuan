import java.util.*;
import processing.sound.*;

//misc
char[][] map;
ArrayList<int[]> mapInfo = new ArrayList<int[]>(15);
ArrayList<Bloons> bloons = new ArrayList<Bloons>(15);
ArrayList<Guiders> guide = new ArrayList<Guiders>(15);
ArrayList<Monkey> monkeyList = new ArrayList<Monkey>(15);
ArrayList<Dart> DartList = new ArrayList();
boolean started = false;
int life = 5;
int tick = 1;
int tickMax = 200;
int money = 650;
int rounds = 1;
Monkey placingMonkey;
Monkey upgradeMonkey;
rounds r = new rounds();

//MAP ASSETS
PImage grass;
PImage road;
PImage startButton;
PImage heart;
PImage coins;
PImage pop;
PImage left;
PImage right;

//BLOON ASSETS
PImage red;
PImage blue;
PImage green;
PImage yellow;
PImage pink;
PImage black;
PImage white;
PImage zebra;

//MONKEY Sprites
PImage monkiDart;
PImage shootiTack;
PImage monkiIce;

//SIDEBAR Sprites
PImage dartMonki;
PImage tackShooti;
PImage bombShooti;
PImage iceMonki;

//music
SoundFile POP;
SoundFile BGM2s;
SoundFile BGM1;
SoundFile BGM2;
SoundFile BGM3;
SoundFile BGM4;
SoundFile BGM5;
SoundFile BGM6;
SoundFile BGM7;
SoundFile BGM8;

int[] start = new int[4];
int sideBarMode = 1;
SideBar sidebar = new SideBar();
PFont font;

void setup(){
  font = createFont("BTDFONT.ttf", 18);
  textFont(font);
  textAlign(CENTER);
  
  //map elements
  grass = loadImage("mapElements/grass.jpeg");
  road = loadImage("mapElements/road.jpg");
  startButton = loadImage("mapElements/startButton.png");
  heart = loadImage("mapElements/heart.png");
  heart.resize(0,40);
  coins = loadImage("mapElements/coins.png");
  coins.resize(0,70);
  grass.resize(0,1080);
  imageMode(CENTER);
  startButton.resize(0,1600);
  imageMode(CORNERS);
  pop = loadImage("mapElements/pop.png");
  pop.resize(0,60);
  left = loadImage("mapElements/leftArrow.png");
  left.resize(0,1000);
  right = loadImage("mapElements/rightArrow.png");
  right.resize(0,1000);
  
  //bloon elements
  red = loadImage("bloons/R.png");
  red.resize(0,100);
  blue = loadImage("bloons/B.png");
  blue.resize(0,100);
  green = loadImage("bloons/G.png");
  green.resize(0, 100);
  yellow = loadImage("bloons/Y.png");
  yellow.resize(0,80);
  pink = loadImage("bloons/P.png");
  pink.resize(0,80);
  black = loadImage("bloons/bb.png");
  black.resize(0,95);
  white = loadImage("bloons/wb.png");
  white.resize(0,95);
  zebra = loadImage("bloons/zb.png");
  zebra.resize(0,90);
  
  //monki sprite elements
  monkiDart = loadImage("monkiDart.png");
  shootiTack = loadImage("tackShooti.png");
  shootiTack.resize(70,0);
  monkiIce = loadImage("IceBase.png");
  monkiIce.resize(75,0);
  
  //monki sidebar elements
  dartMonki = loadImage("sideBarSprites/dartMonki.png");
  tackShooti = loadImage("sideBarSprites/tackShooti.png");
  bombShooti = loadImage("sideBarSprites/bombShooti.png");
  iceMonki = loadImage("sideBarSprites/iceMonki.png");
  
  //map setup
  size(1800, 1000);
  fill(203, 145, 79);
  rect(1500,0,300,1000);
  map = new Map(20,30).getMap();
  
  //sound setup
  POP = new SoundFile(this, "MUSIC/POP.mp3");
  BGM2s = new SoundFile(this, "MUSIC/YEAAA.mp3");
  BGM1 = new SoundFile(this, "MUSIC/BTDBGM1.mp3");
  BGM2 = new SoundFile(this, "MUSIC/BTDBGM2.mp3");
  BGM3 = new SoundFile(this, "MUSIC/BTDBGM3.mp3");
  BGM4 = new SoundFile(this, "MUSIC/BTDBGM4.mp3");
  BGM5 = new SoundFile(this, "MUSIC/BTDBGM5.mp3");
  BGM6 = new SoundFile(this, "MUSIC/BTDBGM6.mp3");
  BGM7 = new SoundFile(this, "MUSIC/BTDBGM7.mp3");
  BGM8 = new SoundFile(this, "MUSIC/BTDBGM8.mp3");
  
  image(grass, 0, 0);
  road.resize(0,50);
  for (int row = 0; row < map.length; row++){
    for (int col = 0; col < map[0].length; col++){
      if (map[row][col] == '@' || map[row][col] == 'E' || map[row][col] == 'F' || map[row][col] == 'B'){
        if (map[row][col] == 'B'){
          start[0] = col*50-50;
          start[1] = row*50+25;
          start[2] = col;
          start[3] = row;
        }
        image(road,col*50, row*50);
        mapInfo.add(new int[] {row, col});
      }
    }
  }
  placeGuiders(start[2], start[3]);
}

void draw(){
  if(!(BGM1.isPlaying() || BGM2.isPlaying() ||BGM2s.isPlaying() ||BGM3.isPlaying() ||BGM4.isPlaying() ||BGM5.isPlaying() ||BGM6.isPlaying() ||BGM7.isPlaying() ||BGM8.isPlaying())){
    int songSel = (int)(Math.random()*8);
    if (songSel == 0){
      BGM1.play();
    }
    if (songSel == 1){
      int easteregg = (int)(Math.random()*10);
      BGM2.play();
      if(easteregg == 1){
        BGM2s.play();
      }
    }
    if (songSel == 2){
      BGM3.play();
    }
    if (songSel == 3){
      BGM4.play();
    }
    if (songSel == 4){
      BGM5.play();
    }
    if (songSel == 5){
      BGM6.play();
    }
    if (songSel == 6){
      BGM7.play();
    }
    if (songSel == 7){
      BGM8.play();
    }
  }
  if (tick == 0 && started)
  bloons(start[0], start[1]);
  background();
  if (started){
  tick ++;
  for (int i = 0; i < bloons.size(); i ++){
    image(bloons.get(i).getType(), bloons.get(i).getX()-50, bloons.get(i).getY()-65);
    bloons.get(i).act();
    if(bloons.get(i).hit()){
      if(bloons.get(i).pop()){
      bloons.remove(bloons.get(i));
      i--;
      }
    }
    if (i >= 0 && bloons.get(i).getCounter() == guide.size()){
      life-= bloons.get(i).getHP();
      bloons.remove(bloons.get(i));
      i--;
    }
  }
  }
  for (Monkey m : monkeyList){
    m.update();
    if (m.getMode()){
      sidebar.makeUpgrade();
      upgradeMonkey = m;
    }
  }
  sidebar.update();
  if (placingMonkey != null){
    boolean canPlace = placingMonkey.placing();
    if (canPlace){
      monkeyList.add(placingMonkey);
      placingMonkey.setX(mouseX);
      placingMonkey.setY(mouseY);
      placingMonkey.setModeNH();
      placingMonkey = null;
    }
  }
  for (int i = 0; i < DartList.size(); i ++){
     Dart dart = (Dart)DartList.get(i);
     dart.update();
  }
  fill(0);
  textSize(11);
  text(frameRate,20,20);
  textSize(18);
  tick = tick % tickMax;
}

void background(){
  image(grass, 0, 0);
  for (int[] x : mapInfo) 
  image(road, x[1]*50, x[0]*50);
  fill(203, 145, 79);
  rect(1500,0,300,1000);
  image(heart, 20, 20);
  image(coins, 145, 5);
  textSize(40);
  fill(255);
  text(life, 95, 55);
  text(" $ " + money, 250, 55);
  text("Round " + rounds, 1350, 55);
}

void mouseClicked(){
  if(mouseX > 1500){
    for (Monkey monkey : monkeyList){
      if(sidebar.isShop()){
        monkey.setModeNH();
      }
    }
    sidebar.onClick();
  }
  else{
    sidebar.makeShop();
    int shortestDist = 1000;
    Monkey closestMonkey = null;
    for (Monkey monkey : monkeyList){
      if (dist(monkey.getX(), monkey.getY(), mouseX, mouseY) < shortestDist){
        shortestDist = (int)(dist(monkey.getX(), monkey.getY(), mouseX, mouseY)+1);
        closestMonkey = monkey;
      }
      monkey.setModeNH();
    }
    if (closestMonkey != null && shortestDist <= closestMonkey.getSize()){
      closestMonkey.setModeH();
    }
  }
}

void bloons(int x, int y){
  if (!r.empty()){
    String bloon = r.getInfo();
    if (bloon.equals("done")) {
      if (bloons.size() != 0){
        r.foundDone();
        tick = 1;
        return;
      }
      started = false;
    }
    else if (bloon.startsWith("max")){
      tickMax = Integer.parseInt(bloon.substring(4, bloon.length()));
    }
    else {
      Bloons b = new Bloons(x, y, bloon);
      bloons.add(b);
    }
  }
}

void placeGuiders(int startx, int starty){
  if (startx < 0 || starty < 0 || startx >= map[0].length || starty >= map.length) return;
  char check = map[starty][startx];
  if (check != 'E' && check != '@' && check != 'B' && check != 'F'){
    return;
  }
  else{
    guide.add(new Guiders(startx*50+25, starty*50+25));
    map[starty][startx] = '#';
    placeGuiders(startx+1, starty);
    placeGuiders(startx-1, starty);
    placeGuiders(startx, starty+1);
    placeGuiders(startx, starty-1);
  }
}
