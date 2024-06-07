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
boolean gameOver = false;
boolean paused = false;
boolean playing = false;
int life = 5;
int tick = 1;
int tickMax = 200;
int money = 650;
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
  fail = new SoundFile(this, "MUSIC/FAIL.mp3");
  
  //bg map setup
  backgroundAndMap();
}

void draw(){
  if (!gameOver){
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
  }
  else {
    rect(0, 0, 1800, 1000);
    if (!paused) {cur.pause(); paused = true;};
    if (!playing) {fail.play(); playing = true;};
  }
}

void mouseClicked(){
  if (!gameOver){
    sidebarOnClick();
  }
}
