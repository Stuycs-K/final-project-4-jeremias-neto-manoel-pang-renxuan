import java.util.*;
char[][] map;
ArrayList<int[]> mapInfo = new ArrayList<int[]>(15);
ArrayList<Bloons> bloons = new ArrayList<Bloons>(15);
ArrayList<Guiders> guide = new ArrayList<Guiders>(15);
ArrayList<Monkey> monkeyList = new ArrayList<Monkey>(15);
ArrayList<Dart> DartList = new ArrayList();
boolean started = false;
int life = 5;
int tick = 1;
int money = 200;
Monkey placingMonkey;
Monkey upgradeMonkey;
//MAP ASSETS
PImage grass;
PImage road;
PImage startButton;
PImage heart;
PImage coins;
//BLOON ASSETS
PImage red;
PImage blue;
PImage green;
PImage yellow;
PImage pink;
//MONKEY ASSETS
PImage dartMonki;
PImage monkiDart;
PImage tackShooti;


int[] start = new int[4];
int sideBarMode = 1;
SideBar sidebar = new SideBar();
PFont font;

void setup(){
  font = createFont("BTDFONT.ttf", 18);
  textFont(font);
  textAlign(CENTER);
  
  //map elements
  grass = loadImage("grass.jpg");
  road = loadImage("road.jpg");
  startButton = loadImage("startButton.png");
  heart = loadImage("heart.png");
  heart.resize(0,40);
  coins = loadImage("coins.png");
  coins.resize(0,70);
  startButton.resize(0,100);
  grass.resize(750,1000);
  
  //bloon elements
  red = loadImage("R.png");
  blue = loadImage("B.png");
  blue.resize(0,100);
  green = loadImage("G.png");
  green.resize(0, 100);
  yellow = loadImage("Y.png");
  yellow.resize(0,80);
  pink = loadImage("P.png");
  pink.resize(0,80);
  
  //monki elements
  dartMonki = loadImage("Dart.png");
  monkiDart = loadImage("monkiDart.png");
  tackShooti = loadImage("tackShooti.png");
  tackShooti.resize(70,0);
  size(1800, 1000);
  fill(203, 145, 79);
  rect(1500,0,300,1000);
  map = new Map(20,30).getMap();
  
  //initial setup
  image(grass, 0, 0);
  image(grass, 750, 0);
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
  System.out.println(guide);
}

void draw(){
  if (tick == 0)
  bloons(start[0], start[1]);
  background();
  if (started){
  for (int i = 0; i < bloons.size(); i ++){
    red.resize(0,100);
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
  tick ++;
  tick = tick % 200;
}

void background(){
  image(grass, 0, 0);
  image(grass, 750, 0);
  for (int[] x : mapInfo) 
  image(road, x[1]*50, x[0]*50);
  fill(203, 145, 79);
  rect(1500,0,300,1000);
  image(heart, 20, 20);
  image(coins, 145, 5);
  textSize(40);
  fill(255);
  text(life, 95, 55);
  text(money, 250, 55);
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
  Bloons b = new Bloons(x, y, "pink");
  bloons.add(b);
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
