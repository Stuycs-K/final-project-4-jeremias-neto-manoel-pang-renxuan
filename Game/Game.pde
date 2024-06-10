import java.util.*;
import processing.sound.*;

//misc
char[][] map;
ArrayList<int[]> mapInfo = new ArrayList<int[]>(15);
ArrayList<Bloons> bloons = new ArrayList<Bloons>(15);
ArrayList<Bloons> snipertargeting = new ArrayList<Bloons>(15);
ArrayList<Bloons> bombList = new ArrayList<Bloons>(15);
ArrayList<Guiders> guide = new ArrayList<Guiders>(15);
ArrayList<Monkey> monkeyList = new ArrayList<Monkey>(15);
ArrayList<Dart> DartList = new ArrayList();
boolean started = false;
boolean gameOver = false;
boolean win = false;
boolean paused = false;
boolean playing = false;
int life = 5;
int tick = 1;
int tickMax = 200;
int money = 100000;
//int money = 650;
int rounds = 0;
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
PImage defeat;

//BLOON ASSETS
PImage red;
PImage blue;
PImage green;
PImage yellow;
PImage pink;
PImage black;
PImage white;
PImage zebra;
PImage rainbow;
PImage Ceram1;
PImage Ceram2;
PImage Ceram3;
PImage Ceram4;
PImage Ceram5;
PImage lead;
PImage MOAB;

//MONKEY Sprites
PImage DartBase;
PImage BoomerangBase;
PImage BombBase;
PImage SniperBase;
PImage TackBase;
PImage SuperBase;
PImage VillageBase;
PImage GunnerBase;

PImage DartP11;
PImage BoomerangP11;
PImage BombP11;
PImage SniperP11;
PImage TackP11;
PImage SuperP11;
PImage VillageP11;

PImage DartP12;
PImage BoomerangP12;
PImage BombP12;
PImage SniperP12;
PImage TackP12;
PImage SuperP12;
PImage VillageP12;

PImage DartP13;
PImage BoomerangP13;
PImage BombP13;
PImage SniperP13;
PImage TackP13;
PImage SuperP13;
PImage VillageP13;

PImage DartP14;
PImage BoomerangP14;
PImage BombP14;
PImage SniperP14;
PImage TackP14;
PImage SuperP14;
PImage VillageP14;

PImage DartP23;
PImage BoomerangP23;
PImage BombP23;
PImage SniperP23;
PImage TackP23;
PImage SuperP23;
PImage VillageP23;

PImage DartP24;
PImage BoomerangP24;
PImage BombP24;
PImage SniperP24;
PImage TackP24;
PImage SuperP24;
PImage VillageP24;

//SIDEBAR Sprites
PImage dartMonki;
PImage tackShooti;
PImage bombShooti;
PImage boomerMonki;
PImage dartiGunni;
PImage snipiMonki;
PImage superMonki;
PImage village;

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
SoundFile cur;
SoundFile fail;

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
  road = loadImage("mapElements/road.jpeg");
  startButton = loadImage("mapElements/startButton.png");
  heart = loadImage("mapElements/heart.png");
  heart.resize(0,300);
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
  defeat = loadImage("mapElements/defeat.png");
  defeat.resize(0,1500);
  
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
  rainbow = loadImage("bloons/rb.png");
  rainbow.resize(0,80);
  Ceram1 = loadImage("bloons/Ceram1.png");
  Ceram2 = loadImage("bloons/Ceram2.png");
  Ceram3 = loadImage("bloons/Ceram3.png");
  Ceram4 = loadImage("bloons/Ceram4.png");
  Ceram5 = loadImage("bloons/Ceram5.png");
  Ceram1.resize(0,65);
  Ceram2.resize(0,65);
  Ceram3.resize(0,65);
  Ceram4.resize(0,65);
  Ceram5.resize(0,65);
  lead = loadImage("bloons/LEAD.png");
  lead.resize(0,65);
  MOAB = loadImage("bloons/MOAB.png");
  MOAB.resize(0,180);
  
  //monki sprite elements
  //.resize(0,80);
DartBase = loadImage("MonkeySprites/DartBase.png");
DartBase.resize(0,80);
BoomerangBase = loadImage("MonkeySprites/BoomerangBase.png");
BoomerangBase.resize(0,80);
BombBase = loadImage("MonkeySprites/BombBase.png");
BombBase.resize(0,80);
SniperBase = loadImage("MonkeySprites/SniperBase.png");
SniperBase.resize(0,80);
TackBase = loadImage("MonkeySprites/TackBase.png");
TackBase.resize(0,80);
SuperBase = loadImage("MonkeySprites/SuperBase.png");
SuperBase.resize(0,90);
VillageBase = loadImage("MonkeySprites/VillageBase.png");
VillageBase.resize(0,130);
GunnerBase = loadImage("MonkeySprites/GunnerBase.png");
GunnerBase.resize(0,120);

DartP11 = loadImage("MonkeySprites/DartP1-1.png");
DartP11.resize(0,80);
BoomerangP11 = loadImage("MonkeySprites/BoomerangP1-1.png");
BoomerangP11.resize(0,80);
BombP11 = loadImage("MonkeySprites/BombP1-1.png");
BombP11.resize(0,80);
SniperP11 = loadImage("MonkeySprites/SniperP1-1.png");
SniperP11.resize(0,80);
TackP11 = loadImage("MonkeySprites/TackP1-1.png");
TackP11.resize(0,80);
SuperP11 = loadImage("MonkeySprites/SuperP1-1.png");
SuperP11.resize(0,90);
VillageP11 = loadImage("MonkeySprites/VillageP1-1.png");
VillageP11.resize(0,140);

DartP12 = loadImage("MonkeySprites/DartP1-2.png");
DartP12.resize(0,80);
BoomerangP12 = loadImage("MonkeySprites/BoomerangP1-2.png");
BoomerangP12.resize(0,80);
BombP12 = loadImage("MonkeySprites/BombP1-2.png");
BombP12.resize(0,80);
SniperP12 = loadImage("MonkeySprites/SniperP1-2.png");
SniperP12.resize(0,80);
TackP12 = loadImage("MonkeySprites/TackP1-2.png");
TackP12.resize(0,80);
SuperP12 = loadImage("MonkeySprites/SuperP1-2.png");
SuperP12.resize(0,90);
VillageP12 = loadImage("MonkeySprites/VillageP1-2.png");
VillageP12.resize(0,150);

DartP13 = loadImage("MonkeySprites/DartP1-3.png");
DartP13.resize(0,100);
BoomerangP13 = loadImage("MonkeySprites/BoomerangP1-3.png");
BoomerangP13.resize(0,80);
BombP13 = loadImage("MonkeySprites/BombP1-3.png");
BombP13.resize(0,80);
SniperP13 = loadImage("MonkeySprites/SniperP1-3.png");
SniperP13.resize(0,80);
TackP13 = loadImage("MonkeySprites/TackP1-3.png");
TackP13.resize(0,80);
SuperP13 = loadImage("MonkeySprites/SuperP1-3.png");
SuperP13.resize(0,100);
VillageP13 = loadImage("MonkeySprites/VillageP1-3.png");
VillageP13.resize(0,160);

DartP14 = loadImage("MonkeySprites/DartP1-4.png");
DartP14.resize(0,100);
BoomerangP14 = loadImage("MonkeySprites/BoomerangP1-3.png");
BoomerangP14.resize(0,80);
BombP14 = loadImage("MonkeySprites/BombP1-4.png");
BombP14.resize(0,80);
SniperP14 = loadImage("MonkeySprites/SniperP1-4.png");
SniperP14.resize(0,80);
TackP14 = loadImage("MonkeySprites/TackP1-4.png");
TackP14.resize(0,80);
SuperP14 = loadImage("MonkeySprites/SuperP1-3.png");
SuperP14.resize(0,100);
VillageP14 = loadImage("MonkeySprites/VillageP1-4.png");
VillageP14.resize(0,160);

DartP23 = loadImage("MonkeySprites/DartP2-3.png");
DartP23.resize(0,80);
BoomerangP23 = loadImage("MonkeySprites/BoomerangP2-3.png");
BoomerangP23.resize(0,80);
BombP23 = loadImage("MonkeySprites/BombP2-3.png");
BombP23.resize(0,80);
SniperP23 = loadImage("MonkeySprites/SniperP2-3.png");
SniperP23.resize(0,80);
TackP23 = loadImage("MonkeySprites/TackP2-3.png");
TackP23.resize(0,80);
SuperP23 = loadImage("MonkeySprites/SuperP2-3.png");
SuperP23.resize(0,100);
VillageP23 = loadImage("MonkeySprites/VillageP2-3.png");
VillageP23.resize(0,130);

DartP24 = loadImage("MonkeySprites/DartP2-4.png");
DartP24.resize(0,80);
BoomerangP24 = loadImage("MonkeySprites/BoomerangP2-4.png");
BoomerangP24.resize(0,80);
BombP24 = loadImage("MonkeySprites/BombP2-4.png");
BombP24.resize(0,80);
SniperP24 = loadImage("MonkeySprites/SniperP2-4.png");
SniperP24.resize(0,80);
TackP24 = loadImage("MonkeySprites/TackP2-4.png");
TackP24.resize(0,80);
SuperP24 = loadImage("MonkeySprites/SuperP2-4.png");
SuperP24.resize(0,100);
VillageP24 = loadImage("MonkeySprites/VillageP2-3.png");
VillageP24.resize(0,130);

  //monki sidebar elements
  dartMonki = loadImage("sideBarSprites/dartMonki.png");
  tackShooti = loadImage("sideBarSprites/tackShooti.png");
  bombShooti = loadImage("sideBarSprites/bombShooti.png");
  boomerMonki = loadImage("sideBarSprites/boomerMonki.png");
  dartiGunni = loadImage("sideBarSprites/dartiGunni.png");
  snipiMonki = loadImage("sideBarSprites/snipiMonki.png");
  superMonki = loadImage("sideBarSprites/superMonki.png");
  village = loadImage("sideBarSprites/village.png");
  
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
  fail = new SoundFile(this, "MUSIC/FAIL.mp3");
  
  //bg map setup
  backgroundAndMap();
}

void draw(){
  if (!gameOver && !win){
    //song selection
    songSelection();
    if (tick == 0 && started)
    bloons(start[0], start[1]);
    background();
    
    //dart updating
    dartUpdate();
    
    //bloon spawning
    if (started){
      tick ++;
      bloonInteraction();
    }
    if (!gameOver){
      //monkey spawning
      monkeySpawning();
      
      //sidebar updates
      sidebarUpdate();
      
      //fps counter
      showFPS();
    }
    //resetting sniper targeting so they dont all attack the same bloon and acomplish nothing (like i do sometimes) ~manoel
    snipertargeting = new ArrayList<Bloons>(15);
    if (rounds == 40 && bloons.size() == 0) win = true;
  }
  else if (gameOver) {
    fill(133, 228, 255);
    rect(0,0,1800,1000);
    image(defeat, -70, -200);
    if (!paused) {cur.pause(); paused = true;};
    if (!playing) {fail.play(); playing = true;};
  }
  else{
    fill(133, 228, 255);
    rect(0,0,1800,1000);
    fill(255,234,63);
    textSize(100);
    text("Winner Winner Banana Dinner", 900, 500);
  }
}

void mouseClicked(){
  if (!gameOver){
    sidebarOnClick();
  }
}
