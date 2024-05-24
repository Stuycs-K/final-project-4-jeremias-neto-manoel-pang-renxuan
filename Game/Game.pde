import java.util.*;
char[][] map;
ArrayList<int[]> mapInfo = new ArrayList<int[]>(15);
ArrayList<Bloons> bloons = new ArrayList<Bloons>(15);
ArrayList<Guiders> guide = new ArrayList<Guiders>(15);
ArrayList<Monkey> monkeyList = new ArrayList<Monkey>(15);
Monkey placingMonkey;
PImage grass;
PImage road;
int[] start = new int[4];
int sideBarMode = 1;

void setup(){
  grass = loadImage("grass.jpg");
  road = loadImage("road.jpg");
  size(1800, 1000);
  rect(1500,0,300,1000);
  map = new Map(20,30).getMap();
  grass.resize(750,1000);
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
  bloons(start[0], start[1]);
}

void draw(){
  background();
  for (Bloons b : bloons){
    circle(b.getX(), b.getY(), 50);
    b.act();
  }
  if (placingMonkey != null){
    boolean canPlace = placingMonkey.placing();
    if (canPlace){
      monkeyList.add(placingMonkey);
      placingMonkey = null;
    }
  }
  for (Monkey m : monkeyList){
    m.update();
  }
}

void background(){
  image(grass, 0, 0);
  image(grass, 750, 0);
  for (int[] x : mapInfo) 
  image(road, x[1]*50, x[0]*50);
  for (Guiders x : guide){
    circle(x.getX(), x.getY(), 10);
  }
}

void mouseClicked(){
  placingMonkey = new DartMonkey();
}

void bloons(int x, int y){
  Bloons red = new Bloons(x, y, 1, 3, guide);
  bloons.add(red);
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
